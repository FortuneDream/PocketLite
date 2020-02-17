import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocket_lite/home/home_body_widget.dart';
import 'package:pocket_lite/home/switch_instrument_dialog.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/model/share.dart';
import 'package:pocket_lite/my/my_widget.dart';
import 'package:pocket_lite/provide/ListDataProvider.dart';
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
      appBar: HomeTitle(context),
      drawer: MyWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          //跳转到搜索
          ListDataProvider.getAllShareList(
              Provider.of<Instrument>(context, listen: false));
          Fluttertoast.showToast(msg: "搜索功能");
        },
      ),
      body: HomeBody(
        shareList,
        itemWidgetCreator: (BuildContext context, int position) {
          return Text(shareList[position].name);
        },
        headerCreator: (BuildContext context, int position) {
          return HeaderContainer(context);
        },
      ),
    );
    return _scaffold;
  }
}

//标题
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

//Stack + Swiper布局
class HeaderContainer extends Stack {
  BuildContext context;

  HeaderContainer(this.context)
      : super(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                  color: Colors.greenAccent,
                  height: 140,
                  width: MediaQuery.of(context).size.width),
              Container(
                  color: Colors.white,
                  height: 40,
                  width: MediaQuery.of(context).size.width),
            ]),
            Center(
                child: Container(
              child: HomeSwiper(),
              height: 160.0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
            ))
          ],
        );
}

//轮播
class HomeSwiper extends StatelessWidget {
  HomeSwiper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Swiper(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Image.asset("images/banner_1.webp", fit: BoxFit.fill);
          } else if (index == 1) {
            return Image.asset("images/banner_2.webp", fit: BoxFit.fill);
          } else {
            return Image.asset("images/banner_3.webp", fit: BoxFit.fill);
          }
        },
        autoplay: true,
        pagination: SwiperPagination(
          margin: EdgeInsets.all(5.0),
        ),
      ),
    );
  }
}
