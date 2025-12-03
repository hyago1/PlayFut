
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChannelPlayer extends StatelessWidget {
  final String id;

  const ChannelPlayer({required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            // Só permite permanecer no domínio embedflix
            if (request.url.contains("embedflix.gold")) {
              return NavigationDecision.navigate;
            }
            // BLOQUEIA qualquer outro link (anúncios)
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://embedflix.gold/tv/player.php?id=$id"));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Assiste ai", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
