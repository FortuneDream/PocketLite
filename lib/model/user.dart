import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Bmob没有提供本地的User操作，所以自己写一份
class User extends BmobUser with ChangeNotifier {
  String _nickName = "";
  int _coin = 0;

  static User localUser;

  String _header;

  get nickName => _nickName;

  set nickName(String nickName) => {_nickName = nickName};

  get coin => _coin;

  get header => _header;

  //注册
  static void registerUser(String username, String password, String nickName) {
    User user = User();
    user.username = username;
    user.password = password;
    user.nickName = nickName;
    user.register().then((BmobRegistered data) {});
  }

  static void loginUser(String username, String password) {
    User user = User();
    user.username = username;
    user.password = password;
    user.login().then((BmobUser bmobUser) {
      _getLocalUser().then((User user) {
        localUser = user;
      });
    });
  }

  //登录
  static Future<User> _getLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.get("username");
    String password = prefs.get("password");
    String nickname = prefs.get("nickname");
    User user = User();
    user.username = username;
    user.password = password;
    user.nickName = nickname;
    await user;
  }

  setNickName(String nickName) {
    this._nickName = nickName;
    notifyListeners();
  }

  addCoin() {
    this._coin++;
    notifyListeners();
  }
}
