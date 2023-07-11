import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PoliticaPage extends StatefulWidget {
  const PoliticaPage({super.key});

  @override
  State<PoliticaPage> createState() => _PoliticaPageState();
}

class _PoliticaPageState extends State<PoliticaPage> {
  @override
  Widget build(BuildContext context) {
    var controllerWeb = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://youtube.com'),
      );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de Privacidade'),
      ),
      body: WebViewWidget(controller: controllerWeb),
    );
  }
}
