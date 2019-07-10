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
  String _platformVersion = 'Unknown';

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
            "MIHNMA0GCSqGSIb3DQEBAQUAA4G7ADCBtwKBrwCnUMP0iJ21ntw4Z3LkUpcoatrGyc/08dcRS5OnU6iTHLcU76xc1Lp1tAkSPBE79JOQ6IwEwwTqPTe8Le965bZlAMT8+0Fc177zr83rXpqioITzJpSzETA3+HpdMVmGWyUR87QbuUtBYBl01u90KtON9X2KzVM0YN8hn0dR/GNtF+K1tjLaqGjb1gGNVG6CrxH4mQKRzqWUU5YFogxhggRmwZdJ5U/2DTGdNydVjHsCAwEAAQ==");
    print("_bazzar_bazzar_bazzar $result");



    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
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
                  child: Text("wm2"),
                  onPressed: () async{
                    Map<String,dynamic> result = await CafebazaarFlutter.launchPurchaseFlow(
                        sku: "wm2", consumption: false);
                    print("resultresult $result");
                  }),
            ),
            Center(
              child: RaisedButton(
                  child: Text("ww"),
                  onPressed: () async{
                    Map<String,dynamic> result = await CafebazaarFlutter.launchPurchaseFlow(
                        sku: "ww", consumption: false);
                    print("resultresult $result");
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
