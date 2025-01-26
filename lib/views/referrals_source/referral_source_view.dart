import 'package:flutter/material.dart';
import 'package:takali/constants/routes.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/helpers/extensions/textstyle.dart';
import 'package:takali/helpers/extensions/media_query.dart';

class ReferralSourceView extends StatefulWidget {
  const ReferralSourceView({super.key});

  @override
  State<ReferralSourceView> createState() => _ReferralSourceViewState();
}

class _ReferralSourceViewState extends State<ReferralSourceView> {
  final List<String> _options = [
    'Google play/App Store',
    'Tiktok',
    'Proche à toi',
    'Instagram',
    'Autre',
  ];

  final Map<String, bool> _selectedOptions = {};
  String? _otherSource;

  @override
  void initState() {
    super.initState();
    for (var option in _options) {
      _selectedOptions[option] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Comment as-tu découvert Takali ?',
              style: context.displayLarge.copyWith(
                color: AppColors.secondary,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 30),

            // Conteneur des options
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: _options.map((option) {
                  return _buildCheckboxOption(option);
                }).toList(),
              ),
            ),

            const SizedBox(height: 30),

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
                onPressed: _submitSelection,
                child: Text(
                  'Valider',
                  style: context.bodyMedium.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxOption(String option) {
    return CheckboxListTile(
      value: _selectedOptions[option],
      onChanged: (value) {
        setState(() {
          _selectedOptions[option] = value!;
          if (option == 'Autre' && value) {
            _showOtherSourceDialog();
          }
        });
      },
      title: Text(
        option,
        style: context.bodyMedium.copyWith(
          color: AppColors.secondary,
          fontWeight: FontWeight.w500,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      activeColor: AppColors.primary,
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  void _showOtherSourceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Autre source',
            style: context.bodyMedium.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Précise ta source',
              hintStyle: context.bodyMedium.copyWith(
                color: Colors.grey.shade500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              _otherSource = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Annuler',
                style: context.bodyMedium.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Valider',
                style: context.bodyMedium.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _submitSelection() {
    final selectedSources = _selectedOptions.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selectedSources.contains('Autre') && _otherSource != null) {
      selectedSources.remove('Autre');
      selectedSources.add('Autre: $_otherSource');
    }

    print('Sources sélectionnées : $selectedSources');
    Navigator.pushReplacementNamed(context, RoutePaths.matchPreference);
  }
}