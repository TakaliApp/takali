import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:takali/app_locator.dart';
import 'package:takali/providers/auth_provider.dart';

class AppProviders {
  AppProviders._();

  static final providers = <SingleChildWidget>[
    ChangeNotifierProvider(create: (context) => locator<AuthProvider>()),
  ];
}