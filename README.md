UX301_DSDT
==========


<br>I Just Publish here my DSDT for UX301LA
<br>Specs:

<br>CPU: i7-4558U (2 x 2,8 + 2HT) (Haswell-ULT)
<br>(Cache: L1=128KB L2=512KB L3=4MB)

GPU: Intel Iris 5100 (Dev=0A2E Ven=8086)
<br>RAM: DDR3L-1600 (2x Elpida 4GB / Onboard)
<br>Chipset: Intel Lynx Point-LP / HM87 / ICH8(m)
<br>Audio: Intel HD (ALC282)
<br>SSD: 2x Sandisk X110(SD6) 128GB (M.2/NGFF)
<br>Touchpad: Elan V6 (Firmware: 6758151)
<br>SD Reader: (Update soon)
<br>Wifi: Intel 7260+BT4.0 AC (M.2/NGFF)
<br>Bluetooth: Intel 7260+BT4.0 AC (M.2/NGFF)
<br>USB: Lynx Point-LP USB xHCI HC
<br>Camera: HD WebCam (Ven=1BCF Dev=2987)
<br>Touchscreen: Atmel maXTouch Digitizer (Ven=3EB Dev=8A0C)
<br>
<br>Intel Wifi will newer work!
<br>Will be changed if any other Wifi Card will be release in NGFF (M.2) Format.


=============
Whats Working:

<br>Audio: (ALC282) Working with Patched AppleHDA
<br>Touchpad: Working with: ElanTouchpad
<br>Graphics: Working with patched DSDT
<br>Backlight Keys: Working with patched DSDT & AsusFNKeys
<br>Backlight Display: Working with Patched DSDT
<br>Battery: Working!
<br>SD Reader: Working OTB (But no entry in Systemprofiler)
Touchscreen: Working with Touch-Base drivers!
KeyboardFN Keys: Working with AsusFNKeys

To-Do:
Sleep: GoToSleep Working / WakeFromSleep causes Shutdown/Reboot
USB: RehabMan GenericUSB - Working, but crashes on some Devices like (Wifi-dongle plug-out)
HD WebCam: Working OTB (But doesnt turns off after you used it)

==============


All help is Welcome.
If you want contact me, just email me at: a.kaplan@oilrec.de

IN PROGRESS...
