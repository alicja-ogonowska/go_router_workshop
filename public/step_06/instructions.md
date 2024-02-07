# Step 6

Many apps use a more complex navigation system.
A common way to do this is to have a widget that stays the same while the user navigates through the app, with only the child of that widget changing.

A 'BottomNavigationBar' is often used for this.

To make this happen, you need to create a 'ShellRoute'.
This will use 'ScaffoldWithBottomBar' as its builder method.
'ScaffoldWithBottomBar' is a custom widget that already includes a 'Scaffold' and a 'BottomNavigationBar'. When you tap on the navigation bar, it changes what you see in the main part of the 'Scaffold'.