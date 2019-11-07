import 'package:werry/config/storage_manager.dart';
import 'package:werry/data/model/login_entity.dart';
import 'package:werry/data/repository/repository.dart';
import 'package:werry/provider/view_state_model.dart';
import 'package:werry/utils/log_utils.dart';

class LoginModel extends ViewStateModel {

  LoginEntity getLogin() {
    return LoginEntity.fromJson(StorageManager.getObject(StorageManager.preLoginUser));
  }

  Future<bool> login(loginName, password) async {
    setBusy();
    try {
      var user = await Repository.login(loginName, password);
      StorageManager.saveObject(StorageManager.preLoginUser, user);
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }

  Future<bool> logout() async {
    setBusy();
    try {
      await Repository.logout();
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }
}
