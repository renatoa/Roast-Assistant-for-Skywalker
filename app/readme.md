This Android app is part of Roast Assistant for Skywalker package, and it's a Skywalker optimized of the greencardigan TC4 Adroid app, forked from here:  
https://github.com/greencardigan/TC4-shield/tree/master/applications/Artisan/TC4_Android/trunk/src/TC4/src/com/greencardigan/tc4

It can be operated exclusivelly with a connection to the ESP32 board that is part of RoastAsistant project, or other data source delivering over classic BT (not BLE) a slightly modified TC4 packet, as below:  
AT, ET, BT, R2R, RoR, HTR, FAN, CNT, Phase; where:  
- AT = ambient temperature,
- ET = Envir/exhaust temp,
- BT = beans temp,
- R2R = optional RoR trend, i.e second derivative of temp; if this data not available then zero value 
- RoR = Rate of Rise,
- HTR = heater, as %,
- FAN = fan, as %,
- CNT = roast process counter,
- Phase = a numeric code of roast process phase: 0 = Idle, 1 = Preheat, then CHARGE, TP, DRY, Brown, Dev, Cool

To start, launch the app.  
If BT not active, will be asked to start it.  
Press leftmost phone navigation bar button (Overview/Recents). A menu bar will open, with three choices:  
- Connect a device
- Load Last
- Load a profile

Press "Connect a device", and select the "AKROASTER" from paired devices list. The app will start getting data from the ESP32 board.  
From there anything happens almost unattended, the app will watch for CHARGE event, start logging, display roasting info and progress, and compute various event estimators.  
During Dry phase you can mark the Dry End event by tapping the status button. Same for FC start, during Brown phase.  
When roast ends, one minute after Cooling phase started, an Artisan compatible .csv log file will be saved in the phone /Roast folder.  
Also, with same name will find there an image file of the graph, with roast statistics in the title.  
If something goes wrong a debug file can be found in the DbgLog folder.

You have attached an app screen, more about screen areas info will follow later.  
The app is stil in development, the loading and roasting using saved profiles is still work in progress.
