import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takali/helpers/extensions/media_query.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/themes/sizes.dart';
import 'package:takali/themes/styles.dart';
import 'package:takali/helpers/extensions/textstyle.dart';
import 'package:takali/viewmodels/login_viewmodel.dart';
import 'package:takali/views/base.view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountry = '+229'; // Code par défaut Bénin
  final List<Map<String, String>> _countries = [
    {'code': '+229', 'flag': '🇧🇯'}, // Bénin
    {'code': '+228', 'flag': '🇹🇬'}, // Togo
    {'code': '+237', 'flag': '🇨🇲'}, // Cameroun
    {'code': '+223', 'flag': '🇲🇱'}, // Mali
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 240, 193),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.small),
          child: Column(
            children: [
              SizedBox(height: context.screenHeight * 0.1),
              // Titre
              Text(
                'Clique.\nDiscute\nTrouve ta vibe !',
                textAlign: TextAlign.center,
                style: context.displayLarge.copyWith(
                  color: AppColors.secondary,
                  height: 1
                ),
              ),

              const Spacer(flex: 10),

              Row(
                children: [
                  // Sélecteur pays
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.xSmall),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(12),
                        value: _selectedCountry,
                        items: _countries.map((country) {
                          return DropdownMenuItem(
                            value: country['code'],
                            child: Row(
                              children: [
                                Text(country['flag']!),
                                const SizedBox(width: Spacing.xSmall),
                                Text(country['code']!),
                              ])
                            );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _selectedCountry = value!);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: Spacing.xSmall),

                  Expanded(
                    child: Container(
                      height: 48, // Hauteur identique au dropdown
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.5),
                            blurRadius: 6,
                            spreadRadius: .5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Votre numéro whatsapp',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          hintStyle: TextStyle(color: AppColors.secondaryDeep.withOpacity(0.6)),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: Spacing.large),

              // Bouton Commencer
              SizedBox(
                width: context.screenWidth * 0.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: _phoneController.text.isEmpty ?
                      const Color.fromARGB(204, 252, 240, 193) :
                      AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  // onPressed: () => model.login(_selectedCountry + _phoneController.text),
                  onPressed: () => {},
                  child: Text(
                    'Continuer !',
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: _phoneController.text.isEmpty ?
                        AppColors.secondaryDeep.withOpacity(0.5) : 
                        AppColors.secondary,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
    
              // Footer
              Column(
                children: [
                  Text.rich(
                    maxLines: 2,
                    TextSpan(
                      text: 'En continuant, tu acceptes nos ',
                      style: const TextStyle(color: AppColors.secondary),
                      children: [
                        TextSpan(
                          text: 'Conditions d\'utilisation',
                          style: context.bodyMedium.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.secondary,
                          ),
                        ),
                        const TextSpan(text: ' ainsi que notre '),
                        TextSpan(
                          text: 'Politique de confidentialité',
                          style: context.bodyMedium.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.secondary,
                          ),
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.small),
                  GestureDetector(
                    onTap: () {},
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Contactez ',
                        style: context.bodyMedium.copyWith(
                          color: AppColors.secondary,
                        ),
                        children: [
                          TextSpan(
                            text: 'help@takali.com',
                            style: context.bodyMedium.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.secondary,
                            ),
                          ),
                          TextSpan(
                            text: ' en cas de problème',
                            style: context.bodyMedium.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}