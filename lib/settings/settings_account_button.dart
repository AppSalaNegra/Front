import 'package:flutter/material.dart';

class SettingAccountButton extends StatelessWidget{

  const SettingAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('hey cuenta'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity, 
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Cuenta',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 30,
            )
          ],
        ),
      ),
    );
  }

}