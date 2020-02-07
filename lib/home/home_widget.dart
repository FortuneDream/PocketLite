import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocket_lite/home/home_body_widget.dart';
import 'package:pocket_lite/model/ShareSong.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/my/my_widget.dart';
import 'package:pocket_lite/home/switch_instrument_dialog.dart';

class HomeWidget extends StatelessWidget {
  Scaffold _scaffold;
  List<ShareSong> shareList = [];
  var instrument = Instrument(0, "吉他", "");

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
              icon: Icon(Icons.star_border),
              onPressed: () {
                //进入个人drawer打开
                Scaffold.of(context).openDrawer();
              });
        }),
        title: Text("口袋乐谱"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.music_note),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SwitchInstrumentScreen(selectIndex: instrument.index);
              })).then((data) {
                if (data != null) {
                  //非空数据返回
                  this.instrument = data;
                }
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
            height: 200,
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
