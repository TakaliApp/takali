import 'dart:io';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exif/exif.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takali/constants/enums.dart';
import 'package:http/http.dart' as http;

import '../../viewmodels/base.viewmodel.dart';

class PhotoUploadViewModel extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  int? currentUploadIndex;
  
  List<String> photos = [];

  Future<void> addPhoto(int index) async {
    try {
      currentUploadIndex = index; 
      setState(ViewModelState.busy);
      
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        final String downloadUrl = await _uploadImage(imageFile);
        
        photos.add(downloadUrl);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Erreur lors de l\'ajout de la photo: $e');
    } finally {
      currentUploadIndex = null;
      setState(ViewModelState.idle);
    }
  }

  bool get isUploading => (currentUploadIndex != null);

  Future<String> _uploadImage(File file) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.cloudinary.com/v1_1/dznouxxn9/image/upload'),
      )
      ..fields['upload_preset'] = 'dev_preset'
      ..files.add(await http.MultipartFile.fromPath(
          'file',
          file.path,
        ));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseData);

        // nécessaire car Image.network n'interprête pas les métadonnées EXIF et affiche une image aux couleurs inversées
        return '${jsonResponse['url']}?fl_awebp.orientation';
      } else {
        throw Exception('Échec de l\'upload: ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('Erreur d\'upload Cloudinary: $e');
      rethrow;
    }
  }

  Future<void> savePhotosToFirestore() async {
    try {
      setState(ViewModelState.busy);
      final user = FirebaseAuth.instance.currentUser!;
      
      await _firestore.collection('users').doc(user.uid).update({
        'photos': photos.map((url) => {
          'url': url,
        }).toList(),
        'profileComplete': true,
      });
    } catch (e) {
      debugPrint('Erreur sauvegarde: $e');
      rethrow;
    } finally {
      setState(ViewModelState.idle);
    }
  }

  void removePhoto(int index) {
    photos.removeAt(index);
    notifyListeners();
  }
}