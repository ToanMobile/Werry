import 'package:localstorage/localstorage.dart';
import 'package:werry/utils/log_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static SharedPreferences sharedPreferences;
  static LocalStorage localStorage;

  Future init() async {
    Log.init();
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    localStorage = LocalStorage('LocalStorage');
    await localStorage.ready;
  }
}
