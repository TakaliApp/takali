import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takali/app_routes.dart';
import 'package:takali/app_locator.dart';
import 'package:takali/app_providers.dart';
import 'package:takali/constants/routes.dart';
import 'package:takali/constants/strings.dart';
import 'package:takali/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:takali/providers/auth_provider.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';

Future globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // hive config
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  await setupLocator();
}

void main() async {
  await globalInitializer();
  runApp(const Takali());
}

class Takali extends StatelessWidget {
  const Takali({super.key});

  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;

    return MultiProvider(
      providers: AppProviders.providers,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          initialRoute: RoutePaths.mainScreen,
          onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
          navigatorKey: context.read<AuthProvider>().navigatorkey,
        );
      },
    );
  }
}
