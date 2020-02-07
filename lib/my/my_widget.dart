import 'package:flutter/material.dart';

//我的
class MyScreen extends Drawer {
  MyScreen()
      : super(
            child: Drawer(
                child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Header"),
              decoration: BoxDecoration(color: Colors.grey),
            ),
            ListTile(
              title: Text("本地曲谱"),
              trailing: Icon(Icons.local_library),
            ),
            ListTile(
              title: Text("我的收藏"),
              trailing: Icon(Icons.star_border),
            )
          ],
        )));
}
