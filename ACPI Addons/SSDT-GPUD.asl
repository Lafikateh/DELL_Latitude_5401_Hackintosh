// SSDT to power off NVIDIA dedicated graphics processor when running XNU
DefinitionBlock("", "SSDT", 2, "LAFIKA", "SSDTGPUD", 0x00000000)
{
	// Import objects
	External(_SB.PCI0.PEG1.PEGP._OFF, MethodObj)
	
	// Virtual device
	Device(GPUD)
	{
		// Device identifier
		Name(_HID, "LFKA0001")
		
		// Device status method
		Method(_STA, 0, NotSerialized)
		{
			// Check if the current operating system is XNU
			If(_OSI("Darwin"))
			{
				// Report as present and enabled
				Return(0x0F)
			}
			Else
			{
				// Report as not present
				Return(0x00)
			}
		}
		
		// Device initialisation method
		Method(_INI)
		{
			// Check if the current operating system is XNU
			If(_OSI("Darwin"))
			{
				// Call the power off function
				\_SB.PCI0.PEG1.PEGP._OFF()
			}
		}
	}
}
