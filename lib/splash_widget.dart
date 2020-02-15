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
    Provider.of<User>(context,listen: false).initLocalUser();
    Provider.of<Instrument>(context,listen: false).initInstrument();
    _Timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _Seconds--;
        if (_Seconds == 0 && !isClickedFastEnter) {
          _Timer.cancel();
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return  HomeWidget();
          }), (route) => route == null);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("口袋乐谱")),
      body: Stack(
        children: <Widget>[
          Image.asset("images/splash_bg.png", fit: BoxFit.cover),
          Container(
              child: Text(
            _Seconds.toString() + "秒之后即将打开app",
            style: TextStyle(color: Colors.red),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isClickedFastEnter = true;
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return HomeWidget();
          }), (route) => route == null);
        },
        child: Icon(Icons.arrow_forward, color: Colors.lightBlueAccent),
        backgroundColor: Colors.white12,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _Timer.cancel();
  }
}
