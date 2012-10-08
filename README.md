GeofenceBug
===========

Demo project created to show how delegate methods are being called twice for boundary crossings.

Problem
=======

When you register a region for monitoring, you should get notified when the boundary is tripped, -didEnterRegion or -didExitRegion.
The problem is this works fine when the app is in the foreground, but recieves double calls on the delegate methods when the app is running in the background.
The location manager is set up as a singleton so that there should only ever be 1 delegate registered for these callbacks.