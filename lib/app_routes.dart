import 'package:flutter/material.dart';
import 'package:takali/views/login/login_view.dart';

import 'constants/routes.dart';

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
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
// }