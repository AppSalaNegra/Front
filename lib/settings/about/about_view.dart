import 'package:flutter/material.dart';
import 'package:sala_negra/settings/about/about_app_bar.dart';
import 'package:sala_negra/settings/about/about_body.dart';

class AboutView extends StatelessWidget{
  
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SalaNegraAboutAppBar(),
      ),
      body: AboutBody()
    );
  }

}