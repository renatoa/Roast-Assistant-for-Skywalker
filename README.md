After initially building the adapter based on Josh Moore's code, which spy the low level protocol between Skywalker and its control panel, then translate into TC4 protocol, allowing communication with Artisan, proceeded to the next level, creating my own control panel extension from scratch, in the form of an alphanumeric LCD attached to the Skywalker panel, on which is all the information necessary to perform a roast, without the need to connect to a computer or looking to a graph.

The extension, which in addition to the LCD also contains an ESP32 processor, has four major functionalities:  
- the basic initial function, Skywalker-TC4 protocol translator, for connecting to a PC, but better done, using interrupts for signal acquisition, without any packet skipping, and also improved resolution using oversampling.
- roasting calculator, doing a much better RoR computation than Skywalker, showing trends and event predictors. Also some roast phases auto detected.
- recorder (logger), storing the last 10 roasts, which can be later downloaded in Artisan csv format, for graphic analysis
- wireless interface, either for remote Artisan, or for an Android graphical application, the later still in the works.

Will illustrate below with CG images (computer generated) a roasting session progress.  
I would like to emphasize that all control is done manually from the original Skywalker control panel.

When starting, or at rest between roasting sessions, the screen shows the following information: status (Idle), time, temperature, RoR, power and air.
[img]https://i.imgur.com/cOFh6mj.png[/img]
The bottom-right empty space is reserved for two dynamic content temporary fields, whose meaning will change at each phase of roasting.

Start the preheat, using the dedicated button on the roaster control panel, this is automatically detected by Roast Assistant (RA), and the information changes as below:
[img]https://i.imgur.com/9VgoThC.png[/img]

When the desired charge temperature has been reached and stabilized, we charge the beans, and the timer is reset, marking the beginning of roasting.  
A little further on we have the TP. Both charging and TP automatically detected.
[img]https://i.imgur.com/g2hcTep.png[/img] [img]https://i.imgur.com/yfWHs8F.png[/img]
A small detail that is still important, let's not forget to signal to the skywalker controller too, that the roast has started, by double R, when the charge is detected, if your roast control panel is one of the early models and lacks auto-detection...  we don't want to forget forever the roaster in the preheat mode, will shutdown after 15 minutes !!!

... drying phase begins... and the left bottom empty space on the display is filled with the information about TP time, as well as a Dry End estimator, which changes dynamically, and stabilizes at a reasonably accurate value after minute 2.
[img]https://i.imgur.com/OY1o7aS.png[/img]

The DE prediction is quite realistic, in the 5-10 seconds ballpark around the display estimate.
In addition to the DE predictor, we have here a new piece of information that helps us control during drying, more exactly the character after the RoR value, which can be ^, _ or nothing.
This character gives us an indication of the RoR evolution trend, or, in other words, signals the coming inflections in the RoR graph.
An inflection is signaled about 3-4 seconds before it visibly occurs, and the fineness of detection has no equivalent on a PC screen, we can say that it could be equated to a pixel on a 4k screen.
Basically, during the drying phase we should only see an upward trend, that is, ^, or nothing, which indicates a flattening in the RoR increase.  
Any appearance of the _ sign, which indicates a dip in RoR, which lasts more than 5 seconds, would require increasing the power.

After the drying phase ends, browning phase follows, with the two temporary fields changing the meaning. 
The lower will store the DE event, the real one, not the predicted, and the field above will show a FC predictor.
[img]https://i.imgur.com/FOKyuii.png[/img]

The RoR evolution trend this time will have to be permanently falling, i.e. marked with _
Any attempt of RoR increase, signaled with ^, and lasting more than 5 seconds, should alert us to decrease power, or increase air, or both.

The FC prediction is not as accurate as DE, primarily because in DE detection I follow a fixed temperature, while FC can be anywhere in a range of about 7 degrees, depending on the beans origin. 
The reference I am using in prediction computation is the temperature of 182 C degrees, where I have FC in 3/4 of the cases.

After FC, the meaning of temporary fields changes again, showing us development time, both as a time value and as a ratio, i.e. percentage:
[img]https://i.imgur.com/yKOQwQb.png[/img]

... based on this information, as well as the evolution of RoR, we will make the decision to drop.
This means opening the door to let the beans flow, followed as fast as possible by long pressing R(oast) on the skywalker controller, otherwise the heat is not cut. The drop is automatically detected on the display.  
Next, you press C for cooling start.

And so... the story ends with the last screen, the cooling screen, where we see a cooling timer.  
When 60 degrees are reached, and the skywalker goes into rest, turning off the fans and the drum, the display returns to Idle, the first screen.

The code of this app was been designed with the maximal flexibility in mind, to allow the most various approaches in its adoption.

There is a basic configuration for existing adapter users, allowing them to reflash their Uno/Nano/etc with just the basic code for improved packet acquisition and resolution increase, then continue working with Artisan as before.

The next step would be to attach the LCD, four wires and nothing else, and you have a new world opened... roast phases, auto-detection, real time RoR and trend guidance, event predictors.

For newcomers obviously is logical to start with ESP32 from the scratch, thus having wireless connections, 10 roasts saved in memory, and Android app, in near future. These features are not available for existing adapters based on Atmel boards, sorry.  

For schematics check hardware folder, for binaries the bin folder
