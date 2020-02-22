import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_lite/detail/detail_widget.dart';
import 'package:pocket_lite/model/share.dart';
import 'package:pocket_lite/provide/ListDataProvider.dart';

class HomeItem extends StatelessWidget {
  final ShareSong song;
  final int index;

  HomeItem(this.song, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
      leading: SizedBox(
          child: Text("${index}",
              style: TextStyle(fontSize: 20, color: Colors.grey))),
      title: Text(song.name, style: TextStyle(fontSize: 14)),
      subtitle: Text(
        song.content,
        style: TextStyle(fontSize: 12),
      ),
      trailing: Container(
        alignment: Alignment.centerRight,
        width: 100,
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        child: Row(children: <Widget>[
          Icon(
            Icons.share,
            color: Colors.greenAccent,
            size: 20,
          ),
          Text(
            song.agreeNum.toString(),
            style: TextStyle(color: Colors.black12),
          ),
          Icon(
            Icons.file_download,
            color: Colors.greenAccent,
            size: 20,
          ),
          Text(song.downloadNum.toString(),
              style: TextStyle(color: Colors.black12)),
          Icon(
            Icons.collections,
            color: Colors.greenAccent,
            size: 20,
          ),
          Text(song.collectionNum.toString(),
              style: TextStyle(color: Colors.black12))
        ]),
      ),
      onTap: () {
        ListDataProvider.getSharePicList(song, (data) {
          List<String> result = List<String>();
          data.forEach((sharePic) {
            print(sharePic.url);
            result.add(sharePic.url);
          });
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return DetailWidget(result, 0);
            },
          ));
        });
      },
    );
  }
}
