import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      //..loadRequest(Uri.parse('https://raw.githubusercontent.com/SoftServ-India/Common-Modules/refs/heads/main/index.html')); // Replace with your URL
     ..loadRequest(Uri.parse('https://softserv-india.github.io/Common-Modules/')); // Replace with your URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView Example"),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: _controller,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _controller.runJavaScript(
                "document.getElementById('inputField').value = 'Hello from Flutter';",
              );
            },
            child: Text("Enter Value"),
          ),
        ],
      ),
    );
  }
}
