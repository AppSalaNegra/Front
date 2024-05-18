import 'package:flutter/material.dart';

class SalaNegraNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const SalaNegraNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Noticias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Programación',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ajustes',
        ),        
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor:const Color.fromARGB(255, 190, 190, 190),
      onTap: onTap,
      backgroundColor: const Color.fromARGB(240,0,0,0),
      elevation: 0,
    );
  }
}