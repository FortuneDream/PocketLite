import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocket_lite/home/home_body.dart';
import 'package:pocket_lite/home/home_item.dart';
import 'package:pocket_lite/home/home_item_title.dart';
import 'package:pocket_lite/home/home_title.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/my/my_widget.dart';
import 'package:provider/provider.dart';

import 'home_header.dart';

class HomeWidget extends StatelessWidget {
  Scaffold _scaffold;

  @override
  Widget build(BuildContext context) {
    _scaffold = Scaffold(
        backgroundColor: Colors.white,
        appBar: HomeTitle(context),
        drawer: MyWidget(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.search, color: Colors.greenAccent),
          onPressed: () {
            Fluttertoast.showToast(msg: "搜索功能");
          },
        ),
        body: Consumer<Instrument>(
          builder: (context, instrument, widget) {
            return HomeBody(
              instrument.shareSongs,
              2,
              itemWidgetCreator: (BuildContext context, int position) {
                return HomeItem(instrument.shareSongs[position], position + 1);
              },
              headerCreator: (BuildContext context, int position) {
                if (position == 0) {
                  return HeaderContainer(context);
                } else {
                  return ItemTitle();
                }
              },
            );
          },
        ));
    return _scaffold;
  }
}
