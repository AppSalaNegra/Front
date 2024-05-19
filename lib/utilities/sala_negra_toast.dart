import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SalaNegraToast{

  static launchAlertToast(BuildContext context, String msg){
    FToast ftoast = FToast();
    ftoast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color:  Color.fromARGB(255, 0, 0, 0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_outlined, color: Colors.white),
          const SizedBox(width: 12.0),
          Text(
            msg,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    ftoast.showToast(
      child: toast, 
      toastDuration: const Duration(seconds: 2),
      gravity: ToastGravity.SNACKBAR
    );
  }

  static launchInfoToast(BuildContext context, String msg){
    FToast ftoast = FToast();
    ftoast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color:  Color.fromARGB(255, 0, 0, 0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info, color: Colors.white),
          const SizedBox(width: 12.0),
          Text(
            msg,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    ftoast.showToast(
      child: toast, 
      toastDuration: const Duration(seconds: 2),
      gravity: ToastGravity.SNACKBAR
    );
  }

}
