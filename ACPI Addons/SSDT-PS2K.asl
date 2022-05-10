// SSDT to fix PS2 keyboard
DefinitionBlock("", "SSDT", 2, "LAFIKA", "SSDTPS2K", 0x00000000)
{
	// Import objects
	External(_SB.PCI0.LPCB.PS2K, DeviceObj)
	
	// Device specific method for PS2 keyboard on LPC bus
	Method(_SB.PCI0.LPCB.PS2K._DSM, 4, NotSerialized)
	{
		If(!Arg2)
		{
			Return(Buffer() { 0x03 })
		}
		Else
		{
			Return(Package() { "RM,oem-id", "DELL", "RM,oem-table-id", "WN09", })
		}
	}
}
