
import 'package:takali/app_locator.dart';
import 'package:takali/constants/api.dart';
import 'package:takali/constants/enums.dart';
import 'package:takali/constants/strings.dart';
import 'package:takali/models/user_model.dart';
import 'package:takali/services/api/api_service.dart';
import 'package:takali/services/base.service.dart';
import 'package:takali/services/local_storage_service.dart';
import 'package:takali/services/user_service.dart';

class AuthService extends BaseService {
  final LocalStorageService _localStorage;

  late bool isUserLoggedIn;
  bool isRefreshing = false;

  AuthService({required LocalStorageService localStorageService}) : _localStorage = localStorageService {
    isUserLoggedIn = (accessToken != null);
  }

  String? get accessToken => _localStorage.getBox(LocalBoxes.settings).getData<String>(LocalStorageKeys.accessToken);
  String? get refreshToken => _localStorage.getBox(LocalBoxes.settings).getData<String>(LocalStorageKeys.refreshToken);

  Future<void> _updateAuthState() async {
    isUserLoggedIn = (accessToken != null);
    await locator<UserService>().onAuthStateChanged();
  }

  // Future<void> register(
  //   String username,
  //   String email,
  //   String password,
  //   UserGender type,
  // ) async {
  //   try {
  //     await locator<ApiService>().postRequest(
  //       ApiConstants.registerEndpoint,
  //       data: {
  //         "username": username,
  //         "email": email,
  //         "password": password,
  //         "type": type.toStr,
  //       },
  //     );
  //   } on DioException catch (e) {
  //     throw Exception(e.response?.data['message'] ?? ErrorMessages.registerError);
  //   } catch (e) {
  //     throw Exception(ErrorMessages.registerError);
  //   }
  // }

  // Future<void> refreshAccessToken() async {
  //   try {
  //     final response = await locator<ApiService>().postRequest(ApiConstants.refreshTokenEndpoint, data: {
  //       "refreshToken": refreshToken,
  //     });

  //     if (response.statusCode == 401) {
  //       await logout();
  //       return;
  //     }

  //     final data = response.data;
  //     final accessToken = data['accessToken'];
  //     await _localStorage.getBox(LocalBoxes.settings).saveData<String>(LocalStorageKeys.accessToken, accessToken);
  //   } catch (e) {
  //     await logout();
  //   }
  // }

  Future<void> logout() async {
    await _localStorage.getBox(LocalBoxes.settings).deleteData(LocalStorageKeys.accessToken);
    await _localStorage.getBox(LocalBoxes.settings).deleteData(LocalStorageKeys.refreshToken);
    await _updateAuthState();
  }
}