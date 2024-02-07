# Step 2

The navigation we've just implemented was pretty straightforward. However, most applications have more intricate navigation structures, with various pages, some of which are children of other pages, and so on.

This brings us to our next topic: the implementation of Navigator 2.0 using a popular navigation package - GoRouter!

To kick off, you'll be working with `MaterialApp.router` and passing a GoRouter configuration to it.

Next, you'll create two routes: 'MainScreen' with the URL path '/' and its child
 route, 'DetailsScreen', with the URL path '/details'.

Once you've set this up, try navigating to a location that isn't defined in the GoRouter configuration. Observe what happens and consider why it behaves this way.