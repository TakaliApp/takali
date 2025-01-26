import 'package:flutter/material.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/helpers/extensions/textstyle.dart';
import 'package:takali/helpers/extensions/media_query.dart';
import 'package:takali/viewmodels/match_preferences_viewmodel.dart';
import 'package:takali/views/base.view.dart';

class MatchPreferencesView extends StatefulWidget {
  const MatchPreferencesView({super.key});

  @override
  State<MatchPreferencesView> createState() => _MatchPreferencesViewState();
}

class _MatchPreferencesViewState extends State<MatchPreferencesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MatchPreferencesViewModel>(
      onModelReady: (model) {
        // Initialisation du ViewModel si nécessaire
      },
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 240, 193),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: context.screenHeight * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tu recherches...',
                style: context.displayLarge.copyWith(
                  color: AppColors.secondary,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 30),

              // Boutons interactifs
              Expanded(
                child: ListView(
                  children: model.options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildOptionButton(option, model),
                    );
                  }).toList(),
                ),
              ),

              // Bouton de validation
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: model.selectedOption != null ? model.submitSelection : null,
                  child: Text(
                    'Continuer',
                    style: context.bodyMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(String option, MatchPreferencesViewModel model) {
    final isSelected = model.selectedOption == option;

    return GestureDetector(
      onTap: () {
        model.selectOption(option);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            option,
            style: context.bodyMedium.copyWith(
              color: isSelected ? Colors.white : AppColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}