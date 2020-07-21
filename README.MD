# OLD CODE!

**WARNING** this library contains premade screens that were done by hand (yuck). They also use the TN3270 command `SFE` which has one key limitation: You must have a space if you change the color. A new a powerful technique was discovered in the ancient mines and now I pass that power on to you, using SF/SA you can change the color whenever you want. On top of that some of the above examples have limited graphic support. Instead you should be using https://github.com/mainframed/ANSi2EBCDiC which will take ANSi art (like something you made in Moebius or TheDraw) and convert it to a beautiful uss table for either z/OS **or** TK4- (MVS 3.8j aka turnkey MVS). I'm keeping these here for historical references but really you should be using the python script instead.



# Mainframe USS Tables
This repo is a collection of mainframe screens. You may refer to these as mainframe logon screens, USS tables, USSTAB, MOTD, VTAM Screen. Whatever you call it the JCL and assembly in this repo should be enough to get you started making your own. 

Your best example is demo_screen.jcl which creates the screen below:
![alt text](https://raw.githubusercontent.com/mainframed/usstable/master/demo_screen.png "Demo VTAM Screen")


