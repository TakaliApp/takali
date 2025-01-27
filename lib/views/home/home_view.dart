import 'package:flutter/material.dart';
import 'package:takali/constants/enums.dart';
import 'package:takali/views/base.view.dart';
import 'package:takali/viewmodels/home_viewmodel.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) async {
        final fetchedUsers = await model.fetchMockUsers();
        setState(() {
          model.matchProfiles = fetchedUsers;
        });
      },
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 240, 193),
        body: model.state == ViewModelState.busy
            ? const Center(child: CircularProgressIndicator())
            : model.matchProfiles.isEmpty
                ? const Center(child: Text("Aucun utilisateur trouvé."))
                : SafeArea(
                    child: Column(
                      children: [
                        Flexible(
                          child: CardSwiper(
                            controller: controller,
                            cardsCount: model.matchProfiles.length,
                            onSwipe: _onSwipe,
                            onUndo: _onUndo,
                            numberOfCardsDisplayed: 1,
                            backCardOffset: const Offset(40, 40),
                            padding: const EdgeInsets.all(24.0),
                            cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                              return PotentialMatchCardWidget(
                                name: model.matchProfiles[index].username,
                                location: model.matchProfiles[index].localization,
                                age: model.yearsOldCalculator(model.matchProfiles[index].birthday),
                                desiredRelation: model.matchProfiles[index].lookingFor,
                                photoUrls: model.matchProfiles[index].photoUrl!,
                                onLike: () {
                                  print("Like"); 
                                  controller.swipe(CardSwiperDirection.right);
                                },
                                onDislike: () {
                                  print("Dislike"); 
                                  controller.swipe(CardSwiperDirection.left);
                                },
                              );
                            },
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