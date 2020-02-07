import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_lite/model/instrument.dart';

class SwitchInstrumentScreen extends StatefulWidget {
  int selectIndex;

  SwitchInstrumentScreen({Key key, @required this.selectIndex})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SwitchInstrumentState(selectIndex);
  }
}

class _SwitchInstrumentState extends State<SwitchInstrumentScreen> {
  final _Instruments = <String>["钢琴", "吉他", "口琴"];
  int selectIndex;

  _SwitchInstrumentState(@required this.selectIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemBuilder: (context, index) {
              //ListTile需要被包裹在Scaffold中
              print(index);
              return ListTile(
                title: Text(_Instruments[index]),
                onTap: () {
                  setState(() {
                    selectIndex = index;
                  });
                  var instrument = Instrument(0, "", "");
                  instrument.index = selectIndex;
                  instrument.typeName = _Instruments[selectIndex];
                  Navigator.pop(context, instrument); //结果返回
                },
                selected: selectIndex == index,
              );
            },
            itemCount: _Instruments.length));
  }
}
