import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class CollectionSong extends BmobObject {
  String name; //收藏曲谱的名字
  String content; //收藏曲谱的描述
  int isFrom; //来自

  CollectionSong(this.name, this.content, this.isFrom) : super();

  getIsFrom() {
    return isFrom;
  }

  void setIsFrom(int isFrom) {
    this.isFrom = isFrom;
  }

  String getContent() {
    return content;
  }

  void setContent(String content) {
    this.content = content;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

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

  factory CollectionSong.fromJson(Map<String, dynamic> json) =>
      _$CollectionSongFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionSongToJson(this);
}

//收藏的图片
@JsonSerializable(explicitToJson: true)
class CollectionPic extends BmobObject {
  CollectionSong collectionSong;
  String url;

  CollectionPic(this.collectionSong, this.url) : super();

  CollectionSong getCollectionSong() {
    return collectionSong;
  }

  void setCollectionSong(CollectionSong collectionSong) {
    this.collectionSong = collectionSong;
  }

  String getUrl() {
    return url;
  }

  void setUrl(String url) {
    this.url = url;
  }

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

  factory CollectionPic.fromJson(Map<String, dynamic> json) =>
      _$CollectionPicFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionPicToJson(this);
}
