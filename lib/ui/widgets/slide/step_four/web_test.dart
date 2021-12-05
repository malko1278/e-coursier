
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebTest extends StatefulWidget {
  const WebTest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<WebTest> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      // initialUrl: 'https://flutter.dev',
      initialUrl: 'https://widget.cloudpayments.ru/bundles/cloudpayments',
    );
  }
}