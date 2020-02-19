import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/model/share.dart';
import 'dart:convert';

class ListDataProvider {
  static final Instruments = <String>[
    "简谱",
    "葫芦丝",
    "吉他/尤克里里",
    "钢琴",
    "萨克斯",
    "二胡",
    "古筝/古琴",
    "电子琴",
    "琵琶",
    "口琴",
    "长笛",
    "笛萧",
    "手风琴",
    "提琴",
    "铜管",
    "扬琴"
  ];

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
