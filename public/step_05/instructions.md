# Step 5

Sometimes, we don't want users to go to certain places in the app. We can send them somewhere else instead. This is called 'redirection'. Other navigation packages often call it 'guards'.

There are two ways to redirect a user - at the route level and at the top level.

For the route level, you set up the redirect when you configure a route. Here's an example:

```dart
GoRoute(path: '/forbiddenPath', redirect: (context, state) => '/newPath'),
 ```

For the top level, you use the 'redirect' method in the GoRouter configuration. This method returns 'null' if the user shouldn't be redirected. Or it returns a new path to send the user to.
This is often used to stop certain users from going to parts of the app. For example, users who aren't logged in, or users who have a free account.
You can write your redirecting code to always work the same way (like never letting users go to the '/details' page). Or you can use a state management solution to make it more complex. I'll use a simple 'ChangeNotifier' that keeps track of whether or not 'details' is enabled. You can change this setting with a 'Switch' on the 'AppBar' on the 'MainScreen'.

Here's the code:
 ```dart
 class AppSettings extends ChangeNotifier {
   bool detailsEnabled = false;

   void toggleDetailsEnabled(bool value) {
     detailsEnabled = value;
     notifyListeners();
   }
 }
 ```