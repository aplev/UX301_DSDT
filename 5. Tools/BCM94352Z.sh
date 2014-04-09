sudo perl -pi -e 's|\x01\x58\x54|\x01\x58\x58|g' /System/Library/Extensions/IO80211Family.kext/Contents/PlugIns/AirPortBrcm4360.kext/Contents/MacOS/AirPortBrcm4360

sudo perl -pi -e 's|\x30\x6B\x10\x00\x00\x75\x0D|\x30\x6B\x10\x00\x00\x74\x0D|' /System/Library/Extensions/IO80211Family.kext/Contents/PlugIns/AirPortBrcm4360.kext/Contents/MacOS/AirPortBrcm4360
