import 'constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:takali/views/otp/otp_view.dart';
import 'package:takali/views/home/home_view.dart';
import 'package:takali/views/login/login_view.dart';
import 'package:takali/views/match_preferences/match_preferences_view.dart';
import 'package:takali/views/photo_upload/photo_upload_view.dart';
import 'package:takali/views/referrals_source/referral_source_view.dart';
import 'package:takali/views/user_infos/user_infos_view.dart';


/// AppRouter is the base class responsible for handling route navigation within the app.
/// It provides a method to generate different routes based on the provided [RouteSettings].
/// Each route is linked to a specific view in the application.
///
/// Example usage:
/// ```dart
/// final Route<dynamic> route = AppRouter.generateRoute(settings);
/// ```
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutePaths.verification:
        return MaterialPageRoute(builder: (_) => OtpVerificationView(), settings: settings);
      case RoutePaths.profile:
        return MaterialPageRoute(builder: (_) => const UserInfoView());
      case RoutePaths.referralSource:
        return MaterialPageRoute(builder: (_) => const ReferralSourceView());
      case RoutePaths.matchPreference:
        return MaterialPageRoute(builder: (_) => const MatchPreferencesView());
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutePaths.photoUpload:
        return MaterialPageRoute(builder: (_) => const PhotoUploadView());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
// }