# Step 7

We did it, we almost did it... Our screens are simple, but the navigation
already looks quite complex. Have you noticed what is missing there?

Well, if you click around MainScreen, ProfileScreen and it's details, you should
 notice that the state of each sub-route is not persisted. Not so nice, right?
 If you read a post on X and then go to the Messages, the
 post will still be waiting for you.

 To achieve that, we need to use a StatefulShellRoute. It's a ShellRoute... that
  preserves a state of each subroute, or rather branch as they are called here.

  Let me be honest with you - this is much more complex than the previous
  examples. I will leave a working example for you - feel free to play around
  with it and familiarize yourself with the code.