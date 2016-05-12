import ok

class SetFPGA:
    def __init__(self):
        return

    def InitializeDevice(self):
        self.xem = ok.okCFrontPanel()
        if self.xem.NoError != self.xem.OpenBySerial(self.xem.GetSerialNumber()):
            print 1
            return False
        self.xem.LoadDefaultPLLConfiguration()
        if self.xem.NoError != self.xem.ConfigureFPGA("USART_RS_232/usart_fifos_manager_tm.bit"):
            print 2
            return False
        if self.xem.IsFrontPanelEnabled() == False:
            print 3
            return False
        return True

    def setBaudRate(self, BaudRate):
        self.xem.SetWireInValue(0x00, int(hex(BaudRate),16))
        self.xem.UpdateWireIns()

    def ResetBoard(self):
        self.xem.ActivateTriggerIn(0x40,0)

    def WriteToBoardRequest(self):
        self.xem.ActivateTriggerIn(0x40,1)

    def BoardWriteReady(self):
        self.xem.UpdateTriggerOuts()
        return self.xem.IsTriggered(0x60,0x01)

    def WriteToBoard(self, data_in):
        return self.xem.WriteToPipeIn(0x80, data_in)

    def PipeComplete(self):
        self.xem.ActivateTriggerIn(0x40,2)

    def ReadFromBoardRequested(self):
        self.xem.UpdateWireOuts()
        return self.xem.GetWireOutValue(0x21)

    def BoardReadReady(self):
        self.xem.ActivateTriggerIn(0x40,3)

    def ReadFromBoard(self, pipe_length):
        data_out = bytearray(pipe_length)
        self.xem.ReadFromPipeOut(0xA0, data_out)
        return data_out

    def ReadCompleted(self):
        self.xem.ActivateTriggerIn(0x40,4)

    def GetDebug(self):
        self.xem.UpdateTriggerOuts()
        return self.xem.IsTriggered(0x60,0x04)

    def GetPipeLength(self):
        self.xem.UpdateWireOuts()
        return self.xem.GetWireOutValue(0x20)

    def ContinueProcess(self):
        self.xem.ActivateTriggerIn(0x40,5)
