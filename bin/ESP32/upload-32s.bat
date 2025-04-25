REM This is for ESP-32s processors
REM update the Arduino paths AND COM port xx, according to your setup
REM this batch file and the .bin file must be placed in same folder
C:\Users\Renato\AppData\Local\Arduino15\packages\esp32\tools\esptool_py\4.5.1/esptool.exe --chip esp32 --port COMxx --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size 4MB 0x1000 ^
C:\<...your path to bin file...>/RoastAssist4Skywalker.ino.bootloader.bin 0x8000 ^
C:\<...your path to bin file...>/RoastAssist4Skywalker.ino.partitions.bin 0xe000 ^
C:\Users\Renato\AppData\Local\Arduino15\packages\esp32\hardware\esp32\2.0.9/tools/partitions/boot_app0.bin 0x10000 ^
C:\<...your path to bin file...>/RoastAssist4Skywalker.ino.bin 
