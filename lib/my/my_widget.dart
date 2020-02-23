import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_lite/model/user.dart';
import 'package:provider/provider.dart';

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
    return Consumer<MyUser>(
      builder: (context, user, _) {
        return Row(
          children: <Widget>[
            ClipOval(
              child: Icon(
                Icons.account_circle,
                color: Colors.green,
                size: 80,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 24,
                      child: Icon(
                        Icons.insert_emoticon,
                        color: Colors.greenAccent,
                      ),
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    ),
                    Flexible(
                      child: Text(
                        "${user.username}",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 24,
                      child: Icon(
                        Icons.music_note,
                        color: Colors.greenAccent,
                      ),
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    ),
                    Flexible(
                      child: Text("${user.coin} 枚"),
                    ),
                  ],
                )
              ],
            )
          ],
        );
      },
    );
  }
}
