import wx
from USART_RS_232_INTERFACE import Frame

## FPGA Configurations (in/out)
# NET RX_IN           LOC   = K12;   JP3 38
# NET TX_OUT          LOC   = K13;   JP3 37

## Main Code
app = wx.App(False)
frame = Frame(None, 'USART RS 232 - Digital Transmission Systems')
app.MainLoop()
