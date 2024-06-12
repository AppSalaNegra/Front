import 'package:flutter/material.dart';

class CatsBarState extends ChangeNotifier {

  static const List cats = ["Todos", "Familiares", "Canalla", "Teatro", "Poesía", "Magia", "Música", "Escuela de Teatro"];

  String? _selectedCat = cats[0];
  
  String? get selectedCat => _selectedCat;

  void selectCat(String cat) {
    _selectedCat = cat;
    notifyListeners();
  }
}