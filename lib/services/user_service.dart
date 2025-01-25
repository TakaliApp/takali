import 'package:takali/constants/api.dart';
import 'package:takali/constants/enums.dart';
import 'package:takali/constants/strings.dart';
import 'package:takali/models/user_model.dart';
import 'package:takali/services/api/api_service.dart';

import '../app_locator.dart';
import 'auth_service.dart';
import 'base.service.dart';
import 'local_storage_service.dart';

class UserService extends BaseService {
  User? user;

  UserService() {
    // user = locator<LocalStorageService>().getBox(LocalBoxes.profile).getData(LocalStorageKeys.userProfile);
  }

  Future<void> onAuthStateChanged() async {
    bool isLoggedIn = locator<AuthService>().isUserLoggedIn;
    isLoggedIn ? await fetchUserData() : await _removeUser();
  }

  Future<void> init() async {
    bool loggedIn = locator<AuthService>().isUserLoggedIn;
    if (loggedIn) {
      getUserFromStorage();
      if (user == null) await fetchUserData();
    }
  }

  void getUserFromStorage() {
    user = locator<LocalStorageService>().getBox(LocalBoxes.profile).getData(LocalStorageKeys.userProfile);
  }

  _storeUser() async {
    await locator<LocalStorageService>().getBox(LocalBoxes.profile).saveData(LocalStorageKeys.userProfile, user);
  }

  _removeUser() async {
    await locator<LocalStorageService>().getBox(LocalBoxes.profile).deleteData(LocalStorageKeys.userProfile);
    user = null;
  }

  Future<void> fetchUserData() async {
    try {
      final response = await locator<ApiService>().getRequest(ApiConstants.profileEndpoint);
      user = User.fromJson(response.data);
      _storeUser();
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}