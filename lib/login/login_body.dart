import 'package:flutter/material.dart';
import 'package:sala_negra/login/login_form.dart';

class LoginBody extends StatelessWidget{
  
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: LoginForm(),
    );
  }
}