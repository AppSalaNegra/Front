import 'package:flutter/material.dart';
import 'package:sala_negra/api/api_operations.dart';
import 'package:sala_negra/login/login_form_controller.dart';
import 'package:sala_negra/shared/nav.dart';
import 'package:sala_negra/register/register_view.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/button_styles.dart';
import 'package:sala_negra/utilities/sala_negra_toast.dart';
import 'package:sala_negra/utilities/text_fields_decoration.dart';

class LoginForm extends StatefulWidget {
  
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  
  final LoginFormController _controller = LoginFormController();
  bool validEmail = true;
  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            margin: const EdgeInsets.only(top: 40),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Correo electrónico:', style: AppFonts.formFont,),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: TextFieldsDecoration.mainFieldShadow, 
                child: TextFormField(
                  expands: false, 
                  style: AppFonts.mediumFont,
                  controller: _controller.email,
                  decoration: 
                  TextFieldsDecoration.mainFieldDecoration,
                  validator: (value) {
                    if(!_controller.validateEmail(value)){
                      SalaNegraToast.launchToast('e-mail inválido');
                      validEmail = false;
                    }else{validEmail = true;}
                    return null;
                  },
                ),
              ),
            ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contraseña:', style: AppFonts.formFont,),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    obscureText: true,
                    expands: false, 
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,
                    controller: _controller.password,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:70),
            child: ElevatedButton(
              style: ButtonStyles.blackButton,
              onPressed: () async {
                if(_loginKey.currentState!.validate()){
                  if(validEmail){
                    final success = await ApiOperations.getInstance().loginSuccess(_controller.email.text, _controller.password.text);
                    if(success && mounted){
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavBar(),
                        settings: const RouteSettings(arguments: false),
                        )
                    );
                    } else{ SalaNegraToast.launchToast('credenciales inválidas');} 
                  }
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text('Entra',
                style: AppFonts.mediumBlackButton
              ),
              )
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                        settings: const RouteSettings(arguments: false),
                        )
                    );
                  },
                  child: const Text(
                    '¿No tienes cuenta? Regístrate',
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