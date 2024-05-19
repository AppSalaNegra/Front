import 'package:flutter/material.dart';
import 'package:sala_negra/api/api_operations.dart';
import 'package:sala_negra/login/login_view.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/button_styles.dart';
import 'package:sala_negra/utilities/text_fields_decoration.dart';
import 'package:sala_negra/register/register_form_controller.dart';
import 'package:sala_negra/utilities/sala_negra_toast.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}


class _RegisterFormState extends State<RegisterForm>{

  final RegisterFormController _controller = RegisterFormController();
  final _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nombre:', style: AppFonts.formFont,),
                Container(
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    expands: false, 
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,
                    controller: _controller.name,
                    validator: (value) {
                      if(!_controller.validateName(value)){
                        SalaNegraToast.launchToast('Nombre inválido');
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Apellidos:', style: AppFonts.formFont,),
                Container(
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    expands: false, 
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,
                    controller: _controller.lastname,
                    validator: (value) {
                      if(!_controller.validateLastname(value)){
                        SalaNegraToast.launchToast('Apellidos inválido');
                      }
                      return null;
                    },                    
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Correo electrónico:', style: AppFonts.formFont,),
                Container(
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    expands: false, 
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,
                    controller: _controller.email,
                    validator: (value) {
                      if(!_controller.validateEmail(value)){
                        SalaNegraToast.launchToast('e-mail inválido');
                      }
                      return null;
                    },                    
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contraseña:', style: AppFonts.formFont,),
                Container(
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    expands: false, 
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,    
                    controller: _controller.password,
                    obscureText: true,               
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Repetir contraseña:', style: AppFonts.formFont,),
                Container(
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    expands: false, 
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,
                    obscureText: true,
                    controller: _controller.repeatPassword,
                    validator: (value) {
                      if(!_controller.validatePassword(_controller.password.text, value)){
                        SalaNegraToast.launchToast('Contraseña inválida');
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
              style: ButtonStyles.blackButton,
              onPressed: () async {
                _registerKey.currentState!.validate();
                if(_controller.validateForm()){
                  String response = await ApiOperations.getInstance().registerSuccess(
                    _controller.email.text, _controller.name.text, 
                    _controller.lastname.text, _controller.password.text);
                  SalaNegraToast.launchToast(response);
                  if(response == 'usuario registrado'){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                        settings: const RouteSettings(arguments: false),
                        )
                    );}
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text('Regístrate',
                style: AppFonts.mediumBlackButton
              ),
              )
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                        settings: const RouteSettings(arguments: false),
                        )
                    );
                  },
                  child: const Text(
                    '¿Ya tienes cuenta? Inicia sesión',
                    style: AppFonts.underlined,
                  ),
                ), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}