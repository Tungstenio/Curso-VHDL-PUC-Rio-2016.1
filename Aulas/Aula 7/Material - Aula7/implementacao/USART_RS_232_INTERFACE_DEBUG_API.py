import ok
import wx
import threading
import math
import pylab
import numpy
import struct
import array

from USART_RS_232_LED import LED
from USART_RS_232_SETFPGA import SetFPGA

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
        self.p.grid = wx.GridBagSizer(hgap = 10, vgap = 10)
        self.sizer = wx.BoxSizer(wx.HORIZONTAL)

        ##Creating Buttons
        self.p.buttonPowerOn  = wx.Button(self.p, label = "Power On")
        self.p.buttonPowerOff = wx.Button(self.p, label = "Power Off")
        self.p.buttonTransmit = wx.Button(self.p, label = "Transmit")

        ##Adding Program LED to Sizer
        self.p.grid.Add(self.ledSTATUS_FPGA_PROG, pos = (0,1))
        self.p.grid.Add(self.ledSTATUS_FPGA_RX, pos = (3,1))

        ## Flavour Text
        self.p.grid.Add(wx.StaticText(self.p, label = " Receiving"), pos  = (3,0))
        self.p.grid.Add(wx.StaticText(self.p, label = " Input Message"), pos  = (4,2))
        self.p.grid.Add(wx.StaticText(self.p, label = " Output Message"), pos  = (4,3))

        ##Adding Buttons to sizer
        self.p.grid.Add(self.p.buttonPowerOn,  pos = (0,0))
        self.p.grid.Add(self.p.buttonPowerOff, pos = (1,0))
        self.p.grid.Add(self.p.buttonTransmit, pos = (2,0))

        ##Binding of buttons
        self.p.Bind(wx.EVT_BUTTON, self.PowerOn,  self.p.buttonPowerOn)
        self.p.Bind(wx.EVT_BUTTON, self.PowerOff, self.p.buttonPowerOff)
        self.p.Bind(wx.EVT_BUTTON, self.Transmit, self.p.buttonTransmit)

        ##Text Boxes
        self.p.TextIn = wx.TextCtrl(self.p, size = (800,400))
        self.p.grid.Add(self.p.TextIn, pos  = (5,2))

        self.p.TextOut = wx.TextCtrl(self.p, size = (800,400))
        self.p.TextOut.SetEditable(False)
        self.p.grid.Add(self.p.TextOut, pos  = (5,3))

        ##Setting main sizers
        self.sizer.Add(self.p, 0, wx.EXPAND)

        ##Setting sizer
        self.p.SetSizerAndFit(self.p.grid)
        self.SetSizerAndFit(self.sizer)

        self.Show(True)

    def PowerOn(self, event):
        self.FPGA = SetFPGA()
        if self.FPGA.InitializeDevice():
            self.ledSTATUS_FPGA_PROG.SetState(2)
            self.ledSTATUS_FPGA_RX.SetState(2)
            threading.Thread(target=self.Receive).start()
        else:
            self.ledSTATUS_FPGA_PROG.SetState(0)

    def PowerOff(self, event):
        self.USART_ON = 0
        self.ledSTATUS_FPGA_PROG.SetState(0)

    def Transmit(self, event):
        message = self.p.TextIn.GetValue()
        message = bytearray(message)
        self.FPGA.ResetBoard()
        self.FPGA.WriteToBoardRequest()
        a = 0
        while(not(self.FPGA.BoardWriteReady())):
            a = a+1
        self.FPGA.WriteToBoard(message)
        self.FPGA.PipeComplete()

    def Receive(self):
        while(self.USART_ON == 1):
            if(self.FPGA.ReadFromBoardRequested()):
                self.ledSTATUS_FPGA_RX.SetState(2)
                self.FPGA.BoardReadReady()
                length = self.FPGA.GetPipeLength()
                message = self.FPGA.ReadFromBoard(length)
                self.FPGA.ReadCompleted()
                self.p.TextOut.SetValue(str(message))
                self.ledSTATUS_FPGA_RX.SetState(1)
            
        
