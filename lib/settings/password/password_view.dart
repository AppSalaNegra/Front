import 'package:flutter/material.dart';
import 'package:sala_negra/settings/password/password_body.dart';
import 'package:sala_negra/shared/appBar/sala_app_bar.dart';

class PasswordView extends StatelessWidget{
  
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SalaNegraAppBar(title: 'CONTRASEÑA'),
      ),
      body: const PasswordBody(),
    );
  }

}