import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
const SettingsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Text(
      'Vista de Ajustes',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}