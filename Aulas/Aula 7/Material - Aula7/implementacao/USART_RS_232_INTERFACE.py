import ok
import wx
import threading
import math
import pylab
import numpy
import struct
import array
import time

from USART_RS_232_LED import LED
from USART_RS_232_SETFPGA import SetFPGA

def Help(word):
    if word == '':
        return 0
    else:
        return int(word,10)

class Frame(wx.Frame):
    def __init__(self, parent, title):
        wx.Frame.__init__(self, parent, title=title)

        self.message = []
        self.message_in = 0
        self.USART_ON = 0

        ##Creating Panel
        self.p = wx.Panel(self, wx.ID_ANY)

        self.ledSTATUS_FPGA_PROG = LED(self.p)
        self.ledSTATUS_FPGA_PROG.SetState(1)
        self.ledSTATUS_FPGA_RX = LED(self.p)
        self.ledSTATUS_FPGA_RX.SetState(0)
        self.GET = 0
        
        ##Creating sizer
        self.p.grid = wx.GridBagSizer(hgap = 2, vgap = 2)
        self.sizer = wx.BoxSizer(wx.HORIZONTAL)

        ##Creating Buttons
        self.p.buttonPowerOn  = wx.Button(self.p, label = "Power &On")
        self.p.buttonPowerOff = wx.Button(self.p, label = "Power O&ff")
        self.p.buttonTransmit = wx.Button(self.p, label = "&Transmit")
##        self.p.buttonReceive = wx.Button(self.p, label = "Receive")

        ##Adding Program LED to Sizer
        self.p.grid.Add(self.ledSTATUS_FPGA_PROG, pos = (0,1))
        self.p.grid.Add(self.ledSTATUS_FPGA_RX, pos = (3,1))

        ## Flavour Text
        self.p.grid.Add(wx.StaticText(self.p, label = " Receiving"), pos  = (3,0))
        self.p.grid.Add(wx.StaticText(self.p, label = " Input Message"), pos  = (5,2))
        self.p.grid.Add(wx.StaticText(self.p, label = " Output Message"), pos  = (5,3))
        self.p.grid.Add(wx.StaticText(self.p, label = " Baud Rate"), pos  = (4,0))
        ##Text Boxes
        self.p.BaudRate = wx.TextCtrl(self.p, size = (80,20))
        self.p.grid.Add(self.p.BaudRate, pos  = (4,1))
        self.p.BaudRate.SetValue(str(9600))

        ##Adding Buttons to sizer
        self.p.grid.Add(self.p.buttonPowerOn,  pos = (0,0))
        self.p.grid.Add(self.p.buttonPowerOff, pos = (1,0))
        self.p.grid.Add(self.p.buttonTransmit, pos = (2,0))
##        self.p.grid.Add(self.p.buttonReceive,  pos = (0,3))

        ##Binding of buttons
        self.p.Bind(wx.EVT_BUTTON, self.PowerOn,  self.p.buttonPowerOn)
        self.p.Bind(wx.EVT_BUTTON, self.PowerOff, self.p.buttonPowerOff)
        self.p.Bind(wx.EVT_BUTTON, self.Transmit, self.p.buttonTransmit)
##        self.p.Bind(wx.EVT_BUTTON, self.Receive,  self.p.buttonReceive)

        ##Text Boxes
        self.p.TextIn = wx.TextCtrl(self.p, size = (200,20), style=wx.TE_PROCESS_ENTER)
##        self.p.TextIn = wx.TextCtrl(self.p, size = (800,400))
        self.p.grid.Add(self.p.TextIn, pos  = (6,2))
        self.p.Bind(wx.EVT_TEXT_ENTER, self.TextInEvt, self.p.TextIn)


        self.p.TextOut = wx.TextCtrl(self.p, size = (200,20))
##        self.p.TextOut = wx.TextCtrl(self.p, size = (800,400))
        self.p.TextOut.SetEditable(False)
        self.p.TextOut.Disable()
        self.p.grid.Add(self.p.TextOut, pos  = (6,3))

        ##Setting main sizers
        self.sizer.Add(self.p, 0, wx.EXPAND)

        ##Setting sizer
        self.p.SetSizerAndFit(self.p.grid)
        self.SetSizerAndFit(self.sizer)

        self.Show(True)

    def PowerOn(self, event):
        self.FPGA = SetFPGA()
        if self.FPGA.InitializeDevice():
            BaudRate = Help(self.p.BaudRate.GetValue())
            self.FPGA.setBaudRate(int(50000000/BaudRate))
            self.ledSTATUS_FPGA_PROG.SetState(2)
            self.ledSTATUS_FPGA_RX.SetState(2)
            self.USART_ON = 1
            threading.Thread(target=self.Receive).start()
        else:
            self.ledSTATUS_FPGA_PROG.SetState(0)

    def PowerOff(self, event):
        self.USART_ON = 0
        self.ledSTATUS_FPGA_PROG.SetState(0)

    def TextInEvt(self, event):
        self.Transmit(1)

    def Transmit(self, event):
        try:
            self.FPGA
        except:
            print "Wtf!? It'll not work if you don't press Program!"
            return
        ## Turn receiver OFF
        self.USART_ON = 0
        
        message = self.p.TextIn.GetValue()

        ## Message to Bytearray routine. It is important
        ## to transform the data type this way otherwise
        ## the pipe structure may malfunction.
        int_aux = []
        message_aux = array.array("B")
        message_aux.fromstring(message)
        length = len(message_aux)
        for i in range(length):
            int_aux.append(message_aux[i])
        if length%2 == 1:
            int_aux.append(9)
            int_aux.append(9)
        else:
            int_aux.append(46)
            int_aux.append(9)
            int_aux.append(9)
        message = bytearray(int_aux)

        ## Send message to board through pipe handshake.
        self.FPGA.ResetBoard()
        self.FPGA.WriteToBoardRequest()
        a = 0
        while(not(self.FPGA.BoardWriteReady())):
            a = a+1
        self.FPGA.WriteToBoard(message)
        self.FPGA.PipeComplete()
        ## Turn receiver ON
        self.USART_ON = 1

    def Receive(self):
        while(self.USART_ON == 1):
            time.sleep(1)
            if(self.FPGA.ReadFromBoardRequested()):
                self.ledSTATUS_FPGA_RX.SetState(2)
                self.FPGA.BoardReadReady()
                length = self.FPGA.GetPipeLength()
                if length%2 == 1:
                    length = length + 1
                message = self.FPGA.ReadFromBoard(length)
                self.FPGA.ReadCompleted()
                message_retrieved = []
                print message
                for i in range(len(message)):
                    if message[i] == 9:
                        break
                    else:
                        message_retrieved.append(message[i])
                self.p.TextOut.SetValue(str(bytearray(message_retrieved)))
                self.ledSTATUS_FPGA_RX.SetState(1)
