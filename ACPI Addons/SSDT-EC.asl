// SSDT for creating a virtual embedded controller
DefinitionBlock("", "SSDT", 2, "LAFIKA", "SSDTEC", 0x00000000)
{
	// Import objects
	External (_SB_.PCI0.LPCB, DeviceObj)
	
	// LPC Bus scope
	Scope(\_SB.PCI0.LPCB)
	{
		// Virtual EC device
		Device(EC)
		{
			// Device identifier
			Name(_HID, "LFKA0002")
			
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
		}
	}
}
