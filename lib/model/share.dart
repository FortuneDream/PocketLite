import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pocket_lite/model/user.dart';

//必须和当前dart文件名字相同
part 'share.g.dart';

//分享乐谱，flutter packages pub run build_runner build
//flutter packages pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class ShareSong extends BmobObject {
  MyUser user; //上传者
  String name; //歌曲名字
  String content; //内容，介绍信息
  int agreeNum; //分享数量
  int downloadNum; //下载量
  int collectionNum; //收藏量
  int instrument; //所属乐器
  //需要加入代餐构造函数
  ShareSong(this.user, this.name, this.content, this.agreeNum, this.downloadNum,
      this.collectionNum, this.instrument);

  @override
  Map getParams() {
    Map<String, dynamic> map = toJson();
    Map<String, dynamic> data = new Map();
    //去除空值
    map.forEach((key, value) {
      if (value != null) {
        data[key] = value;
      }
    });
    return map;
  }

  factory ShareSong.fromJson(Map<String, dynamic> json) =>
      _$ShareSongFromJson(json);

  Map<String, dynamic> toJson() => _$ShareSongToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SharePic extends BmobObject {
  ShareSong shareSong;
  String url;

  SharePic(this.url, this.shareSong);

  @override
  Map getParams() {
    Map<String, dynamic> map = toJson();
    Map<String, dynamic> data = new Map();
    //去除空值
    map.forEach((key, value) {
      if (value != null) {
        data[key] = value;
      }
    });
    return map;
  }

  factory SharePic.fromJson(Map<String, dynamic> json) =>
      _$SharePicFromJson(json);

  Map<String, dynamic> toJson() => _$SharePicToJson(this);
}
