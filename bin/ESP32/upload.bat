REM update the Arduino paths according to your setup
REM pass COM port as bat file parameter at runtime, like c:\...\upload COM3
REM this batch file and the .bin file(s) to be placed in same folder
C:\Users\... your win username ...\AppData\Local\Arduino15\packages\esp32\tools\esptool_py\4.5.1/esptool.exe --chip esp32 --port %1 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size 4MB 0x0 ^
C:\<...your path to bin file...>/RoastAssist4Skywalker.ino.bootloader.bin 0x8000 ^
C:\<...your path to bin file...>/RoastAssist4Skywalker.ino.partitions.bin 0xe000 ^
C:\Users\... your win username ... \AppData\Local\Arduino15\packages\esp32\hardware\esp32\2.0.9/tools/partitions/boot_app0.bin 0x10000 ^
C:\<...your path to bin file...>/RoastAssist4Skywalker.ino.bin 
