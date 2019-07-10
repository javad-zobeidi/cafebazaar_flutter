# cafebazaar_flutter

CafeBazaar In-App Billing Plugin for flutter

This plugin is just for Android applications

## Getting Started

### Import this line in Flutter pubspec
```dart
cafebazaar_flutter: <Last Version>
```

### Updating Your Application's Manifest
Adding the com.farsitel.bazaar.permission.PAY_THROUGH_BAZAAR permission to your AndroidManifest.xml file
```dart
<uses-permission android:name="com.farsitel.bazaar.permission.PAY_THROUGH_BAZAAR" />
```

### To Use CafeBazzar plugin import below code to your class(your payment class)
```dart
import 'package:cafebazaar_flutter/cafebazaar_flutter.dart';
```

** All method be static and don't need to initialize any class


### To show application page in cafeBazaar use this code(نمایش صفحه نرم افزار در کافه بازار)
```dart
CafebazaarFlutter.showProgramPage("packageName")  // Replace "package Name" with Your application Package Name. you can find package name on gradle file

```

### To show comment and privilege in cafeBazaar use this code(ثبت نظر و امتیاز به برنامه)
```dart
CafebazaarFlutter.setComment("packageName")  // Replace "package Name" with Your application Package Name. you can find package name on gradle file

```

### To show Developer page in cafeBazaar use this code(نمایش صفحه برنامه نویس در کافه بازار)
```dart
CafebazaarFlutter.showDeveloperPage("developerId")  // Replace "developerId" with Your developerId in CafeBazaar

```

### To show CafeBazaar Login Page page in cafeBazaar use this code(ارجا کاربر به صفحه لاگین کافه بازار)
```dart
CafebazaarFlutter.showCafebazzarLogin()

```


For use In-app purchases on your application use below code
جهت استفاده از پرداخت درون برنامه ای به صورت زیر عملکنید.

### First of all initialize payment and ras Key in `initState`
use async and await
```dart
await CafebazaarFlutter.initPay(rsaKey:"Your RSA Key From CafeBazaar");

```



### To start a purchase request from your app, call the `launchPurchaseFlow` method on the In-app Billing plugin
```dart
Map<String,dynamic> result = await CafebazaarFlutter.launchPurchaseFlow(
                        sku: "wm2", consumption: false,payload:"bGoa+V7g/yqDXvKRqq+JTFn4uQZbPiQJo4pf9RzJ");
 // after pay you get some data from Cafebazaar, if you get response code -1005 the payment is canceled by the user and  if get code 0  the payment is Success

```
1. `sku` : your product id on CafeBazaar

2. `consumption` : if your product is not a subscriber type you must consume it, For product consumption, set the consumption to true

2.1. `consumption` : زمانی که محصول شما از نوع اشتراکی نباشد و از نوع مصرفی می باشد  باید ان را مصرف کنید تا در خرید ها بعدی کاربر بتواند ان را خریداری کند بجت مصرف یک محصول consumption را به صورت true تنظیم کنید

3.`payload` : The `developerPayload` String is used to specify any additional arguments that you want Bazaar to send back along with the purchase information.


* Result If pay is success
```dart
'{
    "isSuccess": "true",
    "response":"0",
    "message":"Success (response: 0:OK)",
    "purchase":{
       "orderId":"12999763169054705758.1371079406387615",
       "packageName":"com.example.app",
       "productId":"exampleSku",
       "purchaseTime":1345678900000,
       "purchaseState":0,
       "developerPayload":"bGoa+V7g/yqDXvKRqq+JTFn4uQZbPiQJo4pf9RzJ",
       "purchaseToken":"rojeslcdyyiapnqcynkjyyjh"
     }
}'
````


###To get Purchase details use below code
```dart
Map<String,dynamic> result = CafebazaarFlutter.getPurchase(sku:"your product sku") // you can find sku(product id) in your application in-app section
// you get the payment details if you consumption the product result is null
```

Result
```dart
'{
   "orderId":"12999763169054705758.1371079406387615",
   "packageName":"com.example.app",
   "productId":"exampleSku",
   "purchaseTime":1345678900000,
   "purchaseState":0,
   "developerPayload":"bGoa+V7g/yqDXvKRqq+JTFn4uQZbPiQJo4pf9RzJ",
   "purchaseToken":"rojeslcdyyiapnqcynkjyyjh"
 }'
````

* Security Recommendation: When you send a purchase request, create a String token that uniquely identifies this purchase request and include this token in the developerPayload.You can use a randomly generated string as the token. When you receive the purchase response from Bazaar, make sure to check the returned data signature, the orderId, and the developerPayload String. For added security, you should perform the checking on your own secure server. Make sure to verify that the orderId is a unique value that you have not previously processed, and the developerPayload String matches the token that you sent previously with the purchase request.
### After Payment result check developerPayload result true or false
```dart
bool result = await CafebazaarFlutter.verifyDeveloperPayload("your developerPayload");
```

* Important: Remember to unbind from the In-app Billing service when you are done with your Activity. If you don’t unbind, the open service connection could cause your device’s performance to degrade. This example shows how to perform the unbind operation on a service connection to In-app Billing called mServiceConn by overriding the activity’s onDestroy method.

```dart
await CafebazaarFlutter.dispose();
```