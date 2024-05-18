import 'package:flutter/material.dart';
import 'package:sala_negra/models/event.dart';

class ProgListItemState extends ChangeNotifier {
 
  ProgListItemState(this._isLiked, this.event);

  bool _isLiked;

  Event event;

  bool get isLiked => _isLiked;

  void toggleLike() {
    _isLiked = !_isLiked;
    notifyListeners();
  }
}