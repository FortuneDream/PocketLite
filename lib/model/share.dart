import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:pocket_lite/model/user.dart';

//分享乐谱
class ShareSong extends BmobObject {
  MyUser user; //上传者
  String name; //歌曲名字
  String content; //内容，介绍信息
  int agreeNum; //分享数量
  int downloadNum; //下载量
  int collectionNum; //收藏量
  int instrument; //所属月

  @override
  Map getParams() {
    // TODO: implement getParams
    return null;
  }
}

class SharePic extends BmobObject {
  ShareSong shareSong;
  String url;

  @override
  Map getParams() {
    // TODO: implement getParams
    return null;
  }
}
