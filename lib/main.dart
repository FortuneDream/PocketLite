
import 'package:data_plugin/bmob/bmob.dart';
import 'package:data_plugin/bmob/bmob_utils.dart';
import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/material.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:pocket_lite/splash_widget.dart';
import 'package:data_plugin/data_plugin.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

void main() {
  Bmob.initMasterKey("c156f624906eb0246ed20417f2aaf1e0",
      "fa1de8cffc4723568a5821673c6cec62", "eea25467bab8ea7467f57ba9a13ad9c6");
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: User()),
        ChangeNotifierProvider.value(value: Instrument())
      ],
      child: new MaterialApp(
          theme: ThemeData(backgroundColor: Colors.white),
          home: SplashWidget())));
}
