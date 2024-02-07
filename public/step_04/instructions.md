# Step 4

Next, let's learn how to send information from one screen to another. This can be done using path parameters or query parameters.

Consider this example:

```dart
https://www.sephora.com/product/lip-sleeping-mask-P420652?skuId=2743250
```

In our app, we could describe a route like this as '/product/:productName'.
The ':something' syntax indicates a path parameter. Anything after '?' is a pair
 of query parameters (keys and values).
Now, change the DetailsScreen and '/details' route setup so it can take two types of parameters. These are a path parameter called 'id' and a query parameter with a key named 'additionalInfo'.
