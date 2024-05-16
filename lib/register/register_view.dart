import 'package:flutter/material.dart';
import 'package:sala_negra/register/register_body.dart';
import 'package:sala_negra/settings/about/about_app_bar.dart';
import 'package:sala_negra/utilities/app_colors.dart';

class RegisterView extends StatelessWidget{
  
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SalaNegraAboutAppBar(),
      ),
      body: RegisterBody()
    );
  }
}