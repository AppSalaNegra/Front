import 'package:flutter/material.dart';
import 'package:sala_negra/login/login_form.dart';
import 'package:sala_negra/utilities/app_colors.dart';

class LoginBody extends StatelessWidget{
  
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity,
      child: const LoginForm(),
    );
  }
}