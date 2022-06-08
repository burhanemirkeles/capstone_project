// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:capstone_project/Constants.dart';

class CoronaTestWebView extends StatelessWidget {
  const CoronaTestWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Corona Test Information"),
      ),
      body: const WebView(
        initialUrl: coronaTestUrl,
      ),
    );
  }
}
