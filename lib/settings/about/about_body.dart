import 'package:flutter/material.dart';
import 'package:sala_negra/settings/about/about_black_button.dart';
import 'package:sala_negra/settings/about/about_social_links.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'package:sala_negra/utilities/button_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutBody extends StatefulWidget {
  const AboutBody({super.key});
  
  @override
  State<StatefulWidget> createState() => _AboutBodyState();
}

class _AboutBodyState extends State<AboutBody>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AboutBlackButton(title: 'Quiénes somos', padding: 100, onPressed: openQuienesBrowser),
          AboutBlackButton(title: ' Qué hacemos ',padding: 70, onPressed: openQueBrowser),
          const AboutSocialLinks(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: BackButton(
                  color: Colors.white,
                  style: ButtonStyles.backButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openQuienesBrowser() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate
      ..loadRequest(Uri.parse('https://sala-negra.com/somos/'));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Quiénes somos'),
            ),
            body: WebViewWidget(
              controller: controller,
            ),
          );
        }),
      );
    });
  }

  void openQueBrowser() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate
      ..loadRequest(Uri.parse('https://sala-negra.com/hacemos/'));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Qué hacemos'),
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