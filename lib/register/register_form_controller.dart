import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterFormController{

  final TextEditingController name = TextEditingController();
  final TextEditingController lastname = TextEditingController();  
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController(); 

  bool validateEmail(String? email) {
    if(email!.isEmpty){
      return false;
    }
    return EmailValidator.validate(email);
  }

  bool validateName(String? name){
    if(name!.isEmpty){
      return false;
    }
    return true;
  }

  bool validateLastname(String? lastname){
    if(lastname!.isEmpty){
      return false;
    }
    return true;
  }

  bool validatePassword(String? password, String? repeatPassword){
    if(password!.isEmpty || repeatPassword!.isEmpty){
      return false;
    } else if(password != repeatPassword){
      return false;
    }
    return true;
  }

  bool validateForm(){
    if(validateEmail(email.text) && validateName(name.text) && validateLastname(lastname.text) 
      && validatePassword(password.text, repeatPassword.text)){
        return true;
    }
    return false;
  }
}