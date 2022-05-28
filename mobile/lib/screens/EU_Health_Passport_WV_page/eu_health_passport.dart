import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:capstone_project/Constants.dart';

class EuHealthPassportWebView extends StatelessWidget {
  const EuHealthPassportWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EU Health Passport Information"),
      ),
      body: const WebView(
        initialUrl: euHealthPassportUrl,
      ),
    );
  }
}
