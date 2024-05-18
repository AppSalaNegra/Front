import 'package:flutter/material.dart';
import 'package:sala_negra/api/api_operations.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/prog/prog_view.dart';
import 'package:sala_negra/news/news_view.dart';
import 'package:sala_negra/settings/settings_view.dart';
import 'package:sala_negra/shared/appBar/sala_app_bar.dart';
import 'package:sala_negra/shared/navBar/sala_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _selectedIndex = 1;

  // aquí se define la navegación de los botones de la barra inferior
  static final List<Widget> _widgetOptions = <Widget>[
    const NewsView(),
    ProgView(),
    const SettingsView()
  ];
  
  static const List<String> viewTitles = [
    'NOTICIAS', 'PROGRAMACIÓN', 'AJUSTES'
  ];

  @override
  void initState() {
    super.initState();
    _onLoad();
  }

  void _onLoad() async {
    final token = Session.getInstance().token;
    if(await ApiOperations.getInstance().getEvents(token)){
      print("ok");
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Ajusta el tamaño según tus necesidades
        child: SalaNegraAppBar(title: viewTitles[_selectedIndex]),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: 
      SalaNegraNavBar(
        currentIndex: _selectedIndex, 
        onTap: _onItemTapped,
      )
    );
  }
}
