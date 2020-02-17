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
    return Consumer<MyUser>(
      builder: (context, user, _) {
        return Row(
          children: <Widget>[
            ClipOval(
              child: Icon(
                Icons.star,
                color: Colors.red,
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
                        Icons.people,
                        color: Colors.lightBlueAccent,
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
                        Icons.credit_card,
                        color: Colors.amberAccent,
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
