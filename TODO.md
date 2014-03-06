TODO
====

OK, my BoxeeBox is toast, broken, bricked, Green-Red-Red.  Unfortunately, my 2nd replacement is also fubared.  

I do not plan on buying another Boxee Box ...

So, all of the work here is WITHOUT WARRANTY.  IMPLEMENT AT YOUR OWN RISK!  THIS IS INCOMPLETE, WITH NO INTENTION OF FINISHING!

THAT BEING SAID ...
===================

Feel free to fork and continue what I've started - which is a cleaner way to dual-boot XBMC and Boxee.

What works: Added a menu option to kill Boxee and launch XBMC. checkxbmc.sh sleeps until the menu option inserts a flag; then it wakes up, kills Boxee, and launches XBMC.

What doesn't: Choosing "Exit" from XBMC doesn't cleanly restart Boxee. This is because (at the time) the Exit process sometimes crashes, thus returning a different return code. This may have been fixed by now ...

I was going to look into WHY xbmc is mounted as BoxeeLauncher, as this would obviously cause some issues in relaunching Boxee from XBMC. 

Also, the BoxeeHack+ scripts change the HOME directory - so if you execute /init.d/Boxee (not sure of the path from memory) from the actual HOME (/etc/ ? don't remember, but it was where the original settings and such are stored, I believe), it relaunches Boxee.

Good luck, and hope this helps!