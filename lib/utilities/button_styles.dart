import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_colors.dart';

class ButtonStyles{

  static ButtonStyle blackButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(58.0),)
    ),
    overlayColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
    elevation: MaterialStateProperty.all<double>(12)
  );

  static ButtonStyle backButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.all(15.0)
    ),
    overlayColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
    elevation: MaterialStateProperty.all<double>(12)
  );
}