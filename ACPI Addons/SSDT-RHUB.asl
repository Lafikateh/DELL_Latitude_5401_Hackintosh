// SSDT for disabling the XHCI root hub when running XNU
DefinitionBlock ("", "SSDT", 2, "LAFIKA", "SSDTRHUB", 0x00000000)
{
	// Import objects
	External(_SB_.PCI0.XHC_.RHUB, DeviceObj)
	
	// XHCI root hub scope
	Scope(_SB.PCI0.XHC_.RHUB)
	{
		// Device status method
		Method(_STA, 0, NotSerialized)
		{
			// Check if the current operating system is XNU
			If(_OSI("Darwin"))
			{
				// Report as not present
				Return(0x00)
			}
			Else
			{
				// Report as present and enabled
				Return(0x0F)
			}
		}
	}
}
