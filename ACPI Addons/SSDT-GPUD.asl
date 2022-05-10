// SSDT to power off NVIDIA GPU when running XNU
DefinitionBlock("", "SSDT", 2, "LAFIKA", "SSDTGPUD", 0x00000000)
{
	// Import objects
	External(_SB_.PCI0.PEG1.PEGP._DSM, MethodObj)
	External(_SB_.PCI0.PEG1.PEGP._PS3, MethodObj)
	
	// Virtual device
	Device(GPUD)
	{
		// Device identifier
		Name(_HID, "NHG10000")
		
		// Device status method
		Method(_STA, 0, NotSerialized)
		{
			// Check if the current operating system is XNU
			If(_OSI ("Darwin"))
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
		Method(_INI, 0, NotSerialized)
		{
			// Check if the current operating system is XNU
			If(_OSI("Darwin"))
			{
				// If conditional methods reference creation successful
				If((CondRefOf(\_SB.PCI0.PEG1.PEGP._DSM) && CondRefOf(\_SB.PCI0.PEG1.PEGP._PS3)))
				{
					// Issue a power off request to the device
					\_SB.PCI0.PEG1.PEGP._DSM(ToUUID("A486D8F8-0BDA-471B-A72B-6042A6B5BEE0"), 0x0100, 0x1A, Buffer(0x04) { 0x01, 0x00, 0x00, 0x03 })
					
					// Put the device to sleep
					\_SB.PCI0.PEG1.PEGP._PS3()
				}
			}
		}
	}
}
