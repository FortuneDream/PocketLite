import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:provider/provider.dart';

class SwitchInstrumentScreen extends StatefulWidget {
  SwitchInstrumentScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SwitchInstrumentState();
  }
}

class _SwitchInstrumentState extends State<SwitchInstrumentScreen> {
  final _Instruments = <String>["钢琴", "吉他", "口琴"];

  _SwitchInstrumentState();

  @override
  Widget build(BuildContext context) {
    //ListTile需要被包裹在Scaffold中
    return SimpleDialog(title: new Text("选择"), children: <Widget>[
      SizedBox(
        width: 200,
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Consumer<Instrument>(builder:
                  (BuildContext context, Instrument value, Widget child) {
                return ListTile(
                  title: Text(_Instruments[index]),
                  onTap: () {
                    value.index = index;
                  },
                  selected: value.index == index,
                );
              });
            },
            shrinkWrap: true,
            itemCount: _Instruments.length),
      )
    ]);
  }
}
