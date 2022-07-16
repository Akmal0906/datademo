import 'package:hive/hive.dart';

import '../model/user_model.dart';

class HiveDB {
  var box = Hive.box('pdp_online');

  storeUser(User user) {
    box.put('user', user.toJson());
  }

  User loadUser() {
    var user = User.fromJson(box.get('user'));
    return user;
  }

  deleteUser() {
    box.delete('user');
  }
}
