import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:takali/constants/enums.dart';
import 'package:takali/constants/routes.dart';
import 'package:takali/helpers/extensions/media_query.dart';
import 'package:takali/helpers/extensions/textstyle.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/themes/sizes.dart';
import 'package:takali/viewmodels/photo_upload_viewmodel.dart';
import 'package:takali/views/base.view.dart';

class PhotoUploadView extends StatefulWidget {
  const PhotoUploadView({super.key});

  @override
  State<PhotoUploadView> createState() => _PhotoUploadViewState();
}

class _PhotoUploadViewState extends State<PhotoUploadView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<PhotoUploadViewModel>(
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 240, 193),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.1),
              Text(
                "Ajoute des photos",
                style: context.displayLarge.copyWith(
                  color: AppColors.secondary,
                  height: 1,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Ajoute 2 photos pour compléter ton profil. Tu pourras en ajouter plus bientôt.",
                style: context.bodyMedium.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: Spacing.large),
              Expanded(
                child: Center(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: 2, // Seulement 2 emplacements
                    itemBuilder: (context, index) {
                      final hasPhoto = index < model.photos.length;
                      final isUploading = model.currentUploadIndex == index;
                    
                      return _PhotoCard(
                        image: hasPhoto ? model.photos[index] : null,
                        isLoading: isUploading,
                        onTap: () => hasPhoto 
                            ? model.removePhoto(index)
                            : model.addPhoto(index),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: model.photos.isNotEmpty
                          ? AppColors.secondary
                          : Colors.grey[300],
                      foregroundColor: model.photos.isNotEmpty
                          ? Colors.white
                          : AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: model.photos.length >= 2 && model.state != ViewModelState.busy
                      ? () => {} /*model.savePhotosToFirestore().then((_) {
                            Navigator.pushNamed(context, RoutePaths.home);
                          })*/
                      : null,
                    child: model.state == ViewModelState.busy
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Continuer',
                            style: TextStyle(fontSize: 16),
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
}

class _PhotoCard extends StatelessWidget {
  final String? image;
  final VoidCallback onTap;
  final bool isLoading;

  const _PhotoCard({this.image, required this.onTap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.secondary,
                width: 2,
              ),
            ),
          ),
          if (image == null && !isLoading)
            Container(
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(16),
              child: const Icon(
                Icons.add,
                size: 40,
                color: AppColors.secondary,
              ),
            ),
          if (isLoading)
            const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
