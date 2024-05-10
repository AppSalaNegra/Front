
import 'package:flutter/material.dart';

class ProgListItemState extends ChangeNotifier{

// aquí hay que comprobar si el item está en la lista de likes del usuario:
  ProgListItemState();
  
  bool _isLiked = false;

  bool get isLiked => _isLiked;

  void toggleLike() {
    _isLiked = !_isLiked;
    notifyListeners();
  }
}