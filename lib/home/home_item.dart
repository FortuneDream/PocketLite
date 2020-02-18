import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_lite/model/share.dart';

class HomeItem extends StatelessWidget {
  ShareSong song;
  int index;

  HomeItem(this.song, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
      leading: SizedBox(
        child: Center(
          child: Text("${index}",
              style: TextStyle(fontSize: 20, color: Colors.grey)),
        ),
        width: 16,
        height: 16,
      ),
      title: Text(song.name),
      subtitle: Text("副标题"),
    );
  }
}
