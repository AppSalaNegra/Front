import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_colors.dart';

class CatButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  const CatButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: setStyle(),
      onPressed: onPressed,
      child: Text(
        title,
        style: isSelected
            ? Theme.of(context).textTheme.labelSmall
            : Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  ButtonStyle setStyle(){
    return ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primaryColor.withOpacity(0.2);
          }
          return Colors.transparent; 
        },
      ),
    );
  }

}