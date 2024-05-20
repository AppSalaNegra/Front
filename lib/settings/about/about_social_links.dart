import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/social_logos.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutSocialLinks extends StatelessWidget{
  
  const AboutSocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text(
              '¡Encuéntranos!', style: AppFonts.largeFont,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  openBrowser(context, 'https://api.whatsapp.com/message/MARUDKVFJZKZN1?autoload=1&app_absent=0','Whatsapp');
                },
                icon: const Icon(
                  SocialLogos.whatsapp,
                  color: Colors.black,
                  size: 35,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {
                    openBrowser(context, 'https://www.facebook.com/LaSalaNegra','Facebook');
                  },
                  icon: const Icon(
                    SocialLogos.facebook,
                    color: Colors.black,
                    size: 35,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {
                    openBrowser(context, 'https://www.instagram.com/salanegracafeteatro/','Instagram');
                  },
                  icon: const Icon(
                    SocialLogos.instagram,
                    color: Colors.black,
                    size: 35,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {
                    openBrowser(context, 'https://x.com/LaSalaNegra','Twitter');
                  },
                  icon: const Icon(
                    SocialLogos.twitterx,
                    color: Colors.black,
                    size: 35,
                    ),  
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {
                    openBrowser(context, 'https://www.youtube.com/channel/UCwdBlBYQwMS8ctgNQ9LdenQ/featured','Youtube');
                  },
                  icon: const Icon(
                    SocialLogos.youtube,
                    color: Colors.black,
                    size: 45,
                    ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void openBrowser(BuildContext context, String url, String title) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate
      ..loadRequest(Uri.parse(url));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: WebViewWidget(
              controller: controller,
            ),
          );
        }),
      );
    });
  }
}