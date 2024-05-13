import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginFormController{

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  void validateForm(){
    if(!validateEmail(email.text)){
      print('error');
    }
  }
}