import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_lite/home/home_widget.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<StatefulWidget> {
  Timer _Timer;
  bool isClickedFastEnter = false;
  int _Seconds = 2; //n秒后自动进入，或者点击了左下角的按钮也可以直接进入

  @override
  void initState() {
    super.initState();
    //固定登录
    Provider.of<MyUser>(context, listen: false).initLocalUser();
    Provider.of<Instrument>(context, listen: false).initInstrument();
    _Timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _Seconds--;
        if (_Seconds == 0 && !isClickedFastEnter) {
          _Timer.cancel();
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return HomeWidget();
          }), (route) => route == null);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset("images/splash_bg.png", fit: BoxFit.cover),
          Align(
              child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                child: Text(
                  "${_Seconds}秒之后即将打开App",
                  style: TextStyle(fontSize: 12),
                ),
                color: Colors.black12,
                padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
              ),
            ),
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0, 24, 16, 0),
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _Timer.cancel();
  }
}
