//标题
import 'package:flutter/material.dart';

class HomeTitle extends AppBar {
  BuildContext context;

  HomeTitle(this.context)
      : super(
            elevation: 0.0,
            leading: Builder(builder: (context) {
              //必须包裹一层Builder否则无法暂时

              return CircleAvatar(
                backgroundColor: Colors.transparent,
                  child: InkWell(
                      child: Icon(Icons.account_circle,color: Colors.white,size: 30,),
                      onTap: () {
                        //进入个人drawer打开
                        Scaffold.of(context).openDrawer();
                      }));
            }),
            title: Text("口袋Lite"));
}
