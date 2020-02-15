import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Bmob没有提供本地的User操作，所以自己写一份
class User extends BmobUser with ChangeNotifier {
  int _coin = 0;

  String _header;

  get coin => _coin;

  get header => _header;

  //注册
  static void registerUser(String username, String password) {
    User user = User();
    user.username = username;
    user.password = password;
    user.register().then((BmobRegistered data) {});
  }

  Future<User> loginUser(String username, String password) {
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
  Future<User> initLocalUser() async {
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
    this._coin++;
    notifyListeners();
  }
}
