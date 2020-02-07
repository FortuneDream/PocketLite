import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/my/my_widget.dart';
import 'package:pocket_lite/home/switch_instrument_dialog.dart';

class HomeWidget extends StatelessWidget {
  Scaffold _scaffold;
  var instrument = Instrument(0, "吉他", "");

  @override
  Widget build(BuildContext context) {
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
      drawer: MyScreen(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          //跳转到搜索
          Fluttertoast.showToast(msg: "搜索功能");
        },
      ),
      body: MainBodyWidget(),
    );
    return _scaffold;
  }
}

class MainBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("啦啦啦");
  }
}
