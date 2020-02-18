import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocket_lite/home/home_body.dart';
import 'package:pocket_lite/home/home_item.dart';
import 'package:pocket_lite/home/home_item_title.dart';
import 'package:pocket_lite/home/home_swiper.dart';
import 'package:pocket_lite/home/home_title.dart';
import 'package:pocket_lite/home/switch_instrument_dialog.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/model/share.dart';
import 'package:pocket_lite/my/my_widget.dart';
import 'package:pocket_lite/provide/ListDataProvider.dart';
import 'package:provider/provider.dart';

import 'home_header.dart';

class HomeWidget extends StatelessWidget {
  Scaffold _scaffold;
  List<ShareSong> shareList = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 100; i++) {
      ShareSong song = ShareSong();
      song.name = "名字 " + i.toString();
      shareList.add(song);
    }

    _scaffold = Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeTitle(context),
      drawer: MyWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.search, color: Colors.greenAccent),
        onPressed: () {
          //跳转到搜索
          ListDataProvider.getAllShareList(
              Provider.of<Instrument>(context, listen: false));
          Fluttertoast.showToast(msg: "搜索功能");
        },
      ),
      body: HomeBody(
        shareList,
        2,
        itemWidgetCreator: (BuildContext context, int position) {
          return HomeItem(shareList[position], position + 1);
        },
        headerCreator: (BuildContext context, int position) {
          if (position == 0) {
            return HeaderContainer(context);
          } else {
            return ItemTitle();
          }
        },
      ),
    );
    return _scaffold;
  }
}
