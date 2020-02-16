import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:data_plugin/bmob/type/bmob_relation.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Bmob没有提供本地的User操作，所以自己写一份
class MyUser extends BmobUser with ChangeNotifier {
  String _header;

  String _lastSignInDate; //最后一次签到时间

  int _contribution; //硬币

  BmobRelation _collections; //某个用户收藏的所有曲谱

  String _versionFlag; //版本

  String get lastSignInDate => _lastSignInDate;

  int get coin => _contribution;

  String get version => _versionFlag;

  String get header => _header;

  //注册
  static void registerUser(String username, String password) {
    MyUser user = MyUser();
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

  addCoin() {
    this._contribution++;
    notifyListeners();
  }
}
