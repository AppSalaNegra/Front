import 'package:flutter/material.dart';

class NotificationsSwitch extends StatefulWidget{
  
  const NotificationsSwitch({super.key});

  @override
  State<StatefulWidget> createState() => _SwitchExampleState();

}

class _SwitchExampleState extends State<NotificationsSwitch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;
        });
      },
    );
  }
}