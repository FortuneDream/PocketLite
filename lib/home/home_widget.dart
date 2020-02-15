import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocket_lite/home/home_body_widget.dart';
import 'package:pocket_lite/model/share_song.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/model/user.dart';
import 'package:pocket_lite/my/my_widget.dart';
import 'package:pocket_lite/home/switch_instrument_dialog.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        leading: Builder(builder: (context) {
          //必须包裹一层Builder否则无法暂时
          return IconButton(
              icon: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white30,
                child: Image.asset("images/icon.png"),
              ),
              onPressed: () {
                //进入个人drawer打开
                Scaffold.of(context).openDrawer();
              });
        }),
        title: Text("口袋Lite"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.music_note),
            onPressed: () {
              showDialog<Null>(
                  context: context,
                  builder: (BuildContext context){
                return SwitchInstrumentScreen();
              });
            },
          )
        ],
      ),
      drawer: MyWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          //跳转到搜索
          Fluttertoast.showToast(msg: "搜索功能");
        },
      ),
      body: HomeBody(
        shareList,
        itemWidgetCreator: (BuildContext context, int position) {
          return Text(shareList[position].name);
        },
        headerCreator: (BuildContext context, int position) {
          return Container(
            height: 200, //必须要固定宽度，否则因为无法测量出Swiper的高度而无法显示
            child: Swiper(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset("images/splash_bg.png", fit: BoxFit.fill);
              },
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          );
        },
      ),
    );
    return _scaffold;
  }
}
