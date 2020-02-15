import 'package:flutter/widgets.dart';

class Instrument with ChangeNotifier {
  int _index = 0;
  String _typeName = "";
  String _icon = "";

  int get index => _index;

  String get typeName => _typeName;

  set index(int index) {
    this._index = index;
    notifyListeners();
  }
}
