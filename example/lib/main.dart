import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:cafebazaar_flutter/cafebazaar_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    bool result = await CafebazaarFlutter.initPay(
        rsaKey:
            "Yor RSA Key");
    print("_bazzar_bazzar_bazzar $result");



    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: RaisedButton(
                  child: Text("PayFirst"),
                  onPressed: () async{
                    Map<String,dynamic> result = await CafebazaarFlutter.launchPurchaseFlow(
                        sku: "PayFirst", consumption: false,payload: "bGoa+V7g/yqDXvKRqq+JTFn4uQZbPiQJo4pf9RzJ");
                    print("resultresult $result");
                    CafebazaarFlutter.verifyDeveloperPayload(payload: "bGoa+V7g/yqDXvKRqq+JTFn4uQZbPiQJo4pf9RzJ").then((res){
                     print(res);
                   });

                  }),
            ),
            Center(
              child: RaisedButton(
                  child: Text("PaySecond"),
                  onPressed: () async{
                    Map<String,dynamic> result = await CafebazaarFlutter.launchPurchaseFlow(
                        sku: "PaySecond", consumption: true,payload: "yqDXvKRqq+JTFn4uQZbPiQJo4pf9RzJ");
                    print("resultresult $result");
                    CafebazaarFlutter.verifyDeveloperPayload(payload: "yqDXvKRqq+JTFn4uQZbPiQJo4pf9RzJ").then((res){
                      print(res);
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    CafebazaarFlutter.dispose();
    super.dispose();
  }
}
