# DELL Latitude 5401 Hackintosh

### Tested with MacOS 10.15.5

**Device**: DELL Latitude 5401  
**CPU**: Intel Core i5-9400H  
**IGPU**: Intel UHD 630  
**DGPU**: NVIDIA MX150  
**Audio**: Realtek ALC3204, compatible with ALC236  
**Ethernet**: Intel I219-LM  
**Wireless**: Intel AX200  
**Storage**: Hynix BC511 512GB(replaced original Samsung PM981A which is not compatible)  

## Working:
-WiFi  
-Bluetooth  
-Ethernet  
-Integrated GPU with DRM acceleration  
-Battery readout  
-Audio  
-SD Card reader  
-Storage  

## Not working:
-Dedicated GPU(incompatible, disabled via acpi)  
-Trackpad(frozen after waking up from sleep)  
-Trackpoint(nobody uses it anyway)  
-Thunderbolt(shutdown while waking up from sleep)  
