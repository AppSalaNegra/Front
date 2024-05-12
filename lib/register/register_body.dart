import 'package:flutter/material.dart';
import 'package:sala_negra/register/register_form.dart';
import 'package:sala_negra/utilities/app_colors.dart';

class RegisterBody extends StatelessWidget{
  
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity,
      child: const RegisterForm(),
    );
  }
}