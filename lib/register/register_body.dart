import 'package:flutter/material.dart';
import 'package:sala_negra/register/register_form.dart';

class RegisterBody extends StatelessWidget{
  
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-140,
          child: const RegisterForm(),
          )
    );
  }
}