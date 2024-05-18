import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_fonts.dart';

class AccountRemoveButton extends StatelessWidget{
 
  const AccountRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity, 
        child: const Row(
          children: [
            Expanded(
              child: Text(
                'Eliminar cuenta',
                style: AppFonts.largeFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}