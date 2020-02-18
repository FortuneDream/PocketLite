import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/model/share.dart';
import 'dart:convert';

class ListDataProvider {
  static final Instruments = <String>["钢琴", "吉他", "口琴"];

  static void getAllShareList(Instrument instrument) {
    BmobQuery<ShareSong> query = BmobQuery();
    query.addWhereEqualTo("instrument", instrument.index);
    query.queryObjects().then((data) {
      print(data);
    });
  }

  static Instrument getInstrument(int index) {
    return Instrument(index: index, typeName: Instruments[index]);
  }
}
