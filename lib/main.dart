import 'package:data_plugin/bmob/bmob.dart';
import 'package:flutter/material.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/provide/ListDataProvider.dart';
import 'package:pocket_lite/splash_widget.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

void main() {
  //与口袋乐谱公用同一个
  Bmob.initMasterKey("236163bbf4c3be6f2cc44de4405da6eb",
      "7a91bc58cf83cd74619ca30203491b39", "5cb712fc0d5ad8683fada105373bc1d1");
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MyUser()),
        ChangeNotifierProvider.value(
            value:
                Instrument(typeName: ListDataProvider.Instruments[0], index: 0))
      ],
      child: MaterialApp(
          theme: ThemeData(
              backgroundColor: Colors.white, primaryColor: Colors.greenAccent),
          home: SplashWidget())));
}
