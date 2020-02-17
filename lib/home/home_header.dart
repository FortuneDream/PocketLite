//Stack + Swiper布局
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_lite/home/home_swiper.dart';

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
