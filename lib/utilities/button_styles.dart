import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_colors.dart';

class ButtonStyles{

  static ButtonStyle blackButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(58.0),)
    ),
    elevation: WidgetStateProperty.all<double>(12)
  );

  static ButtonStyle backButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
    padding: WidgetStateProperty.all<EdgeInsets>(
      const EdgeInsets.all(15.0)
    ),
    elevation: WidgetStateProperty.all<double>(12)
  );

  static ButtonStyle yellowButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(58.0),)
    ),
    elevation: WidgetStateProperty.all<double>(12)
  );
}