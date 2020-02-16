import 'package:data_plugin/bmob/table/bmob_object.dart';

class CollectionSong extends BmobObject {
  String name; //收藏曲谱的名字
  String content; //收藏曲谱的描述
  int isFrom; //来自

  CollectionSong() {}

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
    return null;
  }
}

//收藏的图片
class CollectionPic extends BmobObject {
  CollectionSong collectionSong;
  String url;

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
    // TODO: implement getParams
    return null;
  }
}
