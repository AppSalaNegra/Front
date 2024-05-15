import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_fonts.dart';

class TextFieldsDecoration{
   
  static InputDecoration mainFieldDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
      borderRadius: BorderRadius.circular(8.0),
    ),
    errorStyle: AppFonts.errorFont,
    errorMaxLines: 1,  
  );

  static const ShapeDecoration mainFieldShadow = 
  ShapeDecoration(
    gradient: LinearGradient(
      colors: [Color.fromARGB(255, 204, 194, 184), Color(0xFFf7f5ec)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.2],
      tileMode: TileMode.clamp,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );

  static InputDecoration emailTextFieldValidation(String value, bool isValid){
    return InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), 
                    borderSide: isValid ? BorderSide.none : const BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
  }
}