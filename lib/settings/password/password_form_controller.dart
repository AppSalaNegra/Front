import 'package:flutter/material.dart';

class PasswordFormController{

  final TextEditingController password = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();
  
  bool validateNewPassword(String? newPassword, String? repeatPassword) {
    if(newPassword!.isEmpty || repeatPassword!.isEmpty){
      return false;
    } else if(newPassword != repeatPassword){
      return false;
    }
    return true;
  }

  bool validatePassword(String? password){
    if(password!.isEmpty){
      return false;
    }
    return true;
  }

  bool validateForm(){
    if(validatePassword(password.text) && validateNewPassword(newPassword.text, repeatPassword.text)){
      return true;
    }
    return false;
  }
}