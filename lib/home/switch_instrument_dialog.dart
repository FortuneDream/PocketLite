import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:provider/provider.dart';

class SwitchInstrumentScreen extends StatelessWidget {
  SwitchInstrumentScreen({Key key}) : super(key: key);

  final _Instruments = <String>["钢琴", "吉他", "口琴"];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: new Text(
          "乐器选择",
          style: TextStyle(color: Colors.blue),
        ),
        children: <Widget>[
          SizedBox(
            width: 200,
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<Instrument>(
                      builder: (context, instrument, _) {
                    return ListTile(
                      title: Text(_Instruments[index]),
                      onTap: () {
                        instrument.index = index;
                        Navigator.of(context).pop(); //弹窗消失也用Navigator的pop方式
                      },
                      selected: instrument.index == index,
                    );
                  });
                },
                shrinkWrap: true,
                itemCount: _Instruments.length),
          )
        ]);
    ;
  }
}
