import 'package:flutter/material.dart';
import 'package:sala_negra/about/about_app_bar.dart';
import 'package:sala_negra/about/about_body.dart';

class AboutView extends StatelessWidget{
  
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SalaNegraAboutAppBar(),
      ),
      body: AboutBody()
    );
  }

}