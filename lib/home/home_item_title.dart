import 'package:flutter/material.dart';
import 'package:pocket_lite/home/switch_instrument_dialog.dart';
import 'package:pocket_lite/model/instrument.dart';
import 'package:provider/provider.dart';

class ItemTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            child: Text("最热谱单",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            margin: EdgeInsets.fromLTRB(16, 8, 0, 0)),
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              child: InkWell(
                child: Text(Provider.of<Instrument>(context).typeName,
                    style: TextStyle(fontSize: 12)),
                onTap: () {
                  showDialog<Null>(
                      context: context,
                      builder: (BuildContext context) {
                        return SwitchInstrumentScreen();
                      });
                },
              ),
              color: Colors.black12,
              padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
            ),
          ),
          alignment: Alignment.centerRight,
          margin: EdgeInsets.fromLTRB(0, 8, 16, 0),
        )
      ],
    );
  }
}
