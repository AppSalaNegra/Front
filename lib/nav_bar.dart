import 'package:flutter/material.dart';
import 'package:sala_negra/home/home_view.dart';
import 'package:sala_negra/news/news_view.dart';
import 'package:sala_negra/settings/settings_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    NewsView(),
    HomeView(),
    SettingsView()
  ];
  
  static const List<String> viewTitles = [
    'NOTICIAS', 'PROGRAMACIÓN', 'AJUSTES' 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // la app var toma un titulo en funcion del indice seleccionado
      appBar: AppBar(
        title: Text(
          viewTitles.elementAt(_selectedIndex),
          style: Theme.of(context).textTheme.titleLarge
          ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      // el body de la app tomará un valor según el indice seleccionado
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}
