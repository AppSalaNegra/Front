import 'package:flutter/material.dart';
import 'package:sala_negra/settings/settings_about_button.dart';
import 'package:sala_negra/settings/settings_account_button.dart';
import 'settings_collection_button.dart';

class SettingsView extends StatelessWidget {
  
const SettingsView({ super.key });

  @override
  Widget build(BuildContext context){
    return const Column(
      children: [
        SettingsCollectionButton(),
        SettingAccountButton(),
        SettingsAccountButton()
      ],
    );
  }
}