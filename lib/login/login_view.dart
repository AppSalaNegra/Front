import 'package:flutter/material.dart';
import 'package:sala_negra/login/login_body.dart';
import 'package:sala_negra/settings/about/about_app_bar.dart';
import 'package:sala_negra/utilities/app_colors.dart';

class LoginView extends StatelessWidget{
  
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: false,
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SalaNegraAboutAppBar(),
      ),
      body: LoginBody()
    );
  }
}