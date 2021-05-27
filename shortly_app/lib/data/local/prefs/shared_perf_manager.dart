import 'dart:convert';
 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shortly_app/data/local/prefs/user_model.dart'; 
 
class SharedPrefrencesManager {
  static const String USER_FILED = "USER_FILED";

  SharedPreferences prefs;
  SharedPrefrencesManager(this.prefs);

  Future storeUser(User user) async {
    return await prefs
        .setString(USER_FILED, json.encode(user))
        .then((value) => () {});
  }

  Future<User> getStoredUser() async {
    try {
      var user = User.fromJson(
          json.decode(prefs.getString(USER_FILED)));
      return user;
    } catch (e) {
      return Future<User>.value(User());
    }
  }
}
