import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//我的
class MyWidget extends Drawer {
  MyWidget()
      : super(
            child: Drawer(
                child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: HeaderWidget(),
              decoration: BoxDecoration(color: Colors.white),
            ),
            ListTile(
              leading: Icon(Icons.local_library, color: Colors.amberAccent),
              title: Text("本地曲谱"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.star_border,
                color: Colors.greenAccent,
              ),
              title: Text("我的收藏"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
                color: Colors.blueAccent,
              ),
              title: Text("反馈帮助"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.purpleAccent,
              ),
              title: Text("退出App"),
              onTap: () {},
            )
          ],
        )));
}

//头部
class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Icon(
            Icons.star,
            color: Colors.red,
            size: 80,
          ),
          margin: EdgeInsets.fromLTRB(8, 0, 0, 8),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.people,
                color: Colors.lightBlueAccent,
              ),
              padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
            ),
            Container(
              child: Icon(
                Icons.credit_card,
                color: Colors.amberAccent,
              ),
              padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
            )
          ],
        )
      ],
    );
  }
}
