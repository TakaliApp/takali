import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takali/app_routes.dart';
import 'package:takali/providers/bottombar_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Navigator(
            key: GlobalKey<NavigatorState>(),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: provider.currentRoute,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) => provider.setIndex(index, context),
            items: const [
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.clone), label: ""),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.heart), label: ""),
            ],
          ),
        );
      },
    );
  }
}