import 'package:flutter/material.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/constants/enums.dart';
import 'package:takali/views/base.view.dart';
import 'package:takali/viewmodels/home_viewmodel.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:takali/helpers/extensions/age_calculator_extension.dart';
import 'package:takali/views/home/widgets/potential_match_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CardSwiperController controller = CardSwiperController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) async {
        final fetchedUsers = await model.fetchUsers();
        final mocukUsers = await model.fetchMockUsers();
        model.allProfiles = [...fetchedUsers, ...mocukUsers];
        setState(() {
          model.users = fetchedUsers;
          model.matchProfiles = mocukUsers;
          model.currentUserName = model.user?.displayName ?? 'Jonh Smith';
          model.currentUserLocation = "Madrid";
          model.currentUserPhotoUrl = model.user?.photoURL ??
              'https://media.istockphoto.com/id/1212702108/fr/photo/jeune-homme-beau-avec-la-barbe-utilisant-le-chandail-occasionnel-restant-au-dessus-du-visage.webp?a=1&b=1&s=612x612&w=0&k=20&c=q9vETFSBLl2Oz1v7Y3T5vkXdlracmXDVZQEwbL6SfKY=';
        });
      },
      onDispose: (model) => controller.dispose(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 240, 193),
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          leading: SizedBox(
            width: 76,
            child: Transform.translate(
              offset: const Offset(20, 0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage:
                    CachedNetworkImageProvider(model.currentUserPhotoUrl),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.currentUserName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  model.currentUserLocation,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.sliders, color: Colors.black),
              onPressed: () {
                // Action pour les notifications
              },
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 252, 240, 193),
          elevation: 0,
        ),
        body: model.state == ViewModelState.busy
            ? const Center(child: CircularProgressIndicator())
            : model.users!.isEmpty
                ? const Center(child: Text("Aucun utilisateur trouvé."))
                : SafeArea(
                    child: Column(
                      children: [
                        Flexible(
                          child: CardSwiper(
                            controller: controller,
                            cardsCount: model.allProfiles.length,
                            onSwipe: _onSwipe,
                            onUndo: _onUndo,
                            numberOfCardsDisplayed: 3,
                            backCardOffset: const Offset(30, 22),
                            padding: const EdgeInsets.all(24.0),
                            cardBuilder: (context,
                                index,
                                horizontalThresholdPercentage,
                                verticalThresholdPercentage) {
                              return PotentialMatchCardWidget(
                                name: model.allProfiles[index].username,
                                location: model.allProfiles[index].localization,
                                age: AgeCalculator(model.allProfiles[index].birthday).age,
                                desiredRelation:
                                    model.allProfiles[index].lookingFor,
                                photoUrls: model.allProfiles[index].photoUrl!,
                                onLike: () {
                                  controller.swipe(CardSwiperDirection.right);
                                },
                                onDislike: () {
                                  controller.swipe(CardSwiperDirection.left);
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Takali - Trouvez votre match parfait",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'La carte $previousIndex a été balayée vers la ${direction.name}. Maintenant, la carte $currentIndex est en haut',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'La carte $currentIndex a été annulée depuis la direction ${direction.name}',
    );
    return true;
  }
}
