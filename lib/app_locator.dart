import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:takali/services/auth_service.dart';
import 'package:takali/services/user_service.dart';
import 'package:takali/providers/auth_provider.dart';
import 'package:takali/services/api/api_service.dart';
import 'package:takali/viewmodels/otp_viewmodel.dart';
import 'package:takali/viewmodels/home_viewmodel.dart';
import 'package:takali/viewmodels/match_viewmodel.dart';
import 'package:takali/viewmodels/login_viewmodel.dart';
import 'package:takali/providers/bottombar_provider.dart';
import 'package:takali/services/local_storage_service.dart';
import 'package:takali/viewmodels/user_infos_viewmodel.dart';
import 'package:takali/viewmodels/photo_upload_viewmodel.dart';
import 'package:takali/viewmodels/referral_source_viewmodel.dart';
import 'package:takali/viewmodels/match_preferences_viewmodel.dart';

GetIt locator = GetIt.instance;

void registerServices() {
  locator.registerSingletonAsync<LocalStorageService>(() async {
    LocalStorageService service = LocalStorageService();
    await service.init();
    return service;
  });
  locator.registerSingleton<ApiService>(ApiService());

  locator.registerSingletonWithDependencies<AuthService>(
    () => AuthService(
      localStorageService: locator<LocalStorageService>(),
    ),
    dependsOn: [LocalStorageService],
  );

  locator.registerSingletonAsync<UserService>(() async {
      UserService service = UserService();
      await service.init();
      return service;
    },
    dependsOn: [LocalStorageService, AuthService],
  );
}

void registerViewModels() {
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<OtpViewModel>(() => OtpViewModel());
  locator.registerFactory<UserInfoViewModel>(() => UserInfoViewModel());
  locator.registerFactory<MatchPreferencesViewModel>(() => MatchPreferencesViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<ReferralSourceViewModel>(() => ReferralSourceViewModel());
  locator.registerFactory<PhotoUploadViewModel>(() => PhotoUploadViewModel());
  locator.registerFactory<MatchViewModel>(() => MatchViewModel());
}

void registerProviders() {
  locator.registerSingletonWithDependencies<AuthProvider>(
    () => AuthProvider(),
    dependsOn: [AuthService],
  );
  locator.registerSingletonWithDependencies<BottomNavigationProvider>(
    () => BottomNavigationProvider(),
    dependsOn: [AuthService],
  );
}

Future<void> setupLocator() async {
  locator.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
      ),
    ),
  );

  registerServices();
  registerViewModels();
  registerProviders();
  await locator.allReady();
}