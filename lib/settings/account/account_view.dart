import 'package:flutter/material.dart';
import 'package:sala_negra/settings/account/account_body.dart';
import 'package:sala_negra/shared/appBar/sala_app_bar.dart';

class AccountView extends StatelessWidget{
  
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SalaNegraAppBar(title: 'CUENTA'),
      ),
      body: AccountBody(),
    );
  }

}