import 'package:flutter/material.dart';
import 'package:sala_negra/shared/appBar/sala_app_bar_logo.dart';

// AppBar de la parte superior
class SalaNegraAppBar extends StatelessWidget {
  
  final String title;
  
  const SalaNegraAppBar({super.key, this.title = 'default'});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), 
            spreadRadius: 1,
            blurRadius: 7, 
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                const SalaNegraAppBarLogo(image: 'assets/img/logo.png'),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 22),
                  margin: const EdgeInsets.only(bottom: 25, right: 20),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 80,
      ),
    );
  }
}