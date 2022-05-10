// SSDT for processor power management
DefinitionBlock ("", "SSDT", 2, "LAFIKA", "SSDTPRPM", 0x00000000)
{
	// Import objects
	External(_SB_.PR00, ProcessorObj)

	// Power management device specific method
	Method(PMPM, 4, NotSerialized)
	{
		// Check if function index is lesser than or equal to zero
		If(LEqual(Arg2, Zero))
		{
			Return(Buffer(One) { 0x03 })
		}
		Else
		{
			Return(Package(0x02) { "plugin-type", One })
		}
	}
	
	// Check if the object is a processor
	If((ObjectType(\_SB.PR00) == 0x0C))
	{
		// First processor scope
		Scope(\_SB.PR00)
		{
			// Check if the current operating system is XNU
			If(_OSI("Darwin"))
			{
				// Device specific method
				Method(_DSM, 4, NotSerialized)  
				{
					Return(PMPM(Arg0, Arg1, Arg2, Arg3))
				}
			}
		}
	}
}
