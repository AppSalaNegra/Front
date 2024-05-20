import 'package:flutter/material.dart';
import 'package:sala_negra/models/post.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:html_unescape/html_unescape.dart';

class NewsListItem extends StatelessWidget {

  final Post post;
  
  const NewsListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    HtmlUnescape escape = HtmlUnescape();

    void _openWebBrowser() {
      var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate
      ..loadRequest(Uri.parse(post.url));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(escape.convert(post.title)),
            ),
            body: WebViewWidget(
              controller: controller,
            ),
          );
        }),
      );
    }
    return GestureDetector(
      onTap: () {
        _openWebBrowser();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 370,
              child: Image.network(
                post.thumbnailUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded.toDouble() / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );             
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace){
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Color.fromARGB(255, 2, 2, 2),
                        size: 64.0,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Error al cargar la imagen',
                        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  );
                }, 
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
                        child: Text(
                          escape.convert(post.title),
                          style: AppFonts.newsItemTitle
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}