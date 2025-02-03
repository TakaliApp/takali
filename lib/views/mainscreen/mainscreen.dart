import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takali/app_routes.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/providers/bottombar_provider.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Navigator(
            key: GlobalKey<NavigatorState>(),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: provider.currentRoute,
          ),
          bottomNavigationBar: SizedBox(
            height: 150, // Hauteur fixe pour le conteneur
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: DotNavigationBar(
                    backgroundColor: Colors.white,
                    currentIndex: provider.currentIndex,
                    //dotIndicatorColor: Colors.transparent,
                    unselectedItemColor: Colors.grey[300],
                    enableFloatingNavBar: true,
                    onTap: (index) => provider.setIndex(index, context),
                    marginR: const EdgeInsets.symmetric(horizontal: 10,),
                    paddingR: const EdgeInsets.only(bottom: 4, top: 10),
                    itemPadding: const EdgeInsets.only(left: 60, top: 5, bottom: 5, right: 44),
                    items: [
                      DotNavigationBarItem(
                        icon: const Icon(FontAwesomeIcons.clone),
                        selectedColor: AppColors.secondary,
                        unselectedColor: Colors.grey,
                      ),
                      DotNavigationBarItem(
                        icon: const Icon(FontAwesomeIcons.heart),
                        selectedColor: AppColors.secondary,
                        unselectedColor: Colors.grey,
                      ),
                    ],
                    borderRadius: 20,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}