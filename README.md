GeofenceBug
===========

Demo project created to show how delegate methods are being called twice for boundary crossings.

Problem
=======

When you register a region for monitoring, you should get notified when the boundary is tripped, -didEnterRegion or -didExitRegion.
The problem is this works fine when the app is in the foreground, but recieves double calls on the delegate methods when the app is running in the background.
The location manager is set up as a singleton so that there should only ever be 1 delegate registered for these callbacks.

Steps To Reproduce
==================

1. Start the app up. It will automatically create a geofence (my house coordinates)
2. Use the location setting in the simulator to enter/exit the fence. (You can grab coords from ViewController.m)
3. Background the app
4. Trigger another location change, that event will duplicate the delegate method
5. Trigger another location, not a duplicate
6. Return app to foreground, trigger location change, delegate method no longer duping