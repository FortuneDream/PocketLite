import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:data_plugin/bmob/type/bmob_relation.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

//Bmob没有提供本地的User操作，所以自己写一份
@JsonSerializable()
class MyUser extends BmobUser with ChangeNotifier {
  //不能是私有的
  String header;

  String lastSignInDate; //最后一次签到时间

  int contribution; //硬币

  BmobRelation collections; //某个用户收藏的所有曲谱

  String versionFlag; //版本

  int get coin=>contribution;



  MyUser(this.header, this.lastSignInDate, this.contribution, this.versionFlag)
      : super();

  factory MyUser.fromJson(Map<String, dynamic> json) =>
      _$MyUserFromJson(json);

  Map<String, dynamic> toJson() => _$MyUserToJson(this);

  //注册
  static void registerUser(String username, String password) {
    MyUser user = MyUser("", "", 0, "1.0");
    user.username = username;
    user.password = password;
    user.register().then((BmobRegistered data) {});
  }

  Future<MyUser> loginUser(String username, String password) {
    this.password = password;
    this.username = username;
    login().then((BmobUser user) {
      Future<SharedPreferences> prefs = SharedPreferences.getInstance();
      prefs.then((SharedPreferences value) {
        value.setString("username", user.username);
        value.setString("password", user.password);
        notifyListeners();
      });
    });
  }

  //如果没有登录就直接登录，登录了就用本地缓存的
  Future<MyUser> initLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.get("username");
    String password = prefs.get("password");
    if (username == null) {
      //本地没有，就直接登录
      loginUser("812568684@qq.com", "123456");
    } else {
      this.username = username;
      this.password = password;
      notifyListeners();
    }
    await this;
  }
}
