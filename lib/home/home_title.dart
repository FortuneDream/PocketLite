
//标题
import 'package:flutter/material.dart';
import 'package:pocket_lite/home/switch_instrument_dialog.dart';

class HomeTitle extends AppBar {
  BuildContext context;

  HomeTitle(this.context)
      : super(
      elevation: 0.0,
      leading: Builder(builder: (context) {
        //必须包裹一层Builder否则无法暂时

        return IconButton(
            icon: ClipOval(
              child: Container(
                  child: Image.asset("images/icon.png"),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3))),
            ),
            onPressed: () {
              //进入个人drawer打开
              Scaffold.of(context).openDrawer();
            });
      }),
      title: Text("口袋Lite"),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.music_note,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog<Null>(
                context: context,
                builder: (BuildContext context) {
                  return SwitchInstrumentScreen();
                });
          },
        )
      ]);
}