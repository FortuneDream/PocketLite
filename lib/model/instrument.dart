import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocket_lite/constant.dart';
import 'package:pocket_lite/model/share.dart';
import 'package:pocket_lite/provide/ListDataProvider.dart';
import 'package:pocket_lite/sp_util.dart';
import 'package:provider/provider.dart';

class Instrument with ChangeNotifier {
  int _index = 0;

  String _typeName = "";

  List<ShareSong> _shareSongs;

  Instrument({int index, String typeName, List<ShareSong> list}) : super() {
    this._index = index;
    this._typeName = typeName;
    this._shareSongs = list;
    notifyListeners();
  }

  void initData({int index, String typeName, List<ShareSong> list}) {
    this._typeName = typeName;
    this._index = index;
    this._shareSongs = list;
    notifyListeners();
  }

  int get index => _index;

  String get typeName => _typeName;

  List<ShareSong> get shareSongs => _shareSongs;

  void initInstrument(BuildContext context) {
    SpUtil.get(Constant.INSTRUMENT_INDEX).then((value) {
      int index = value == null ? 0 : int.parse(value);
      ListDataProvider.getAllShareList(index, (List<ShareSong> list) {
        if (list == null) {
          Fluttertoast.showToast(msg: "网络异常");
          return;
        }
        HashMap<String, String> map = HashMap();
        map[Constant.INSTRUMENT_INDEX] = index.toString(); //持久化保存
        SpUtil.set(map);
        Provider.of<Instrument>(context, listen: false).initData(
            index: index,
            typeName: ListDataProvider.Instruments[index],
            list: list);
      });
    });
  }
}
