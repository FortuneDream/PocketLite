import 'package:flutter/widgets.dart';
import 'package:pocket_lite/constant.dart';
import 'package:pocket_lite/sp_util.dart';

class Instrument with ChangeNotifier {
  int _index = 0;

  String _typeName = "";

  int get index => _index;

  String get typeName => _typeName;

  set index(int index) {
    this._index = index;
    notifyListeners();
  }

  void initInstrument() {
    SpUtil.get(Constant.INSTRUMENT_INDEX).then((value) {
      if (value == null) {
        this.index = 0;
      } else {
        this.index = int.parse(value);
      }
    });
  }
}
