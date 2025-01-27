import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takali/constants/enums.dart';

import '../../viewmodels/base.viewmodel.dart';

class PhotoUploadViewModel extends BaseViewModel {
  final FirebaseStorage _storage = FirebaseStorage.instance;
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
        imageQuality: 70,
      );

      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        final File compressedImage = await _compressImage(imageFile);
        final String downloadUrl = await _uploadImage(compressedImage);
        
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

  Future<File> _compressImage(File file) async {
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: 70,
    );
    return File(file.path)..writeAsBytesSync(result!);
  }

  Future<String> _uploadImage(File image) async {
    final user = FirebaseAuth.instance.currentUser!;
    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final Reference ref = _storage.ref().child('users/${user.uid}/$fileName');
    
    await ref.putFile(image);
    return await ref.getDownloadURL();
  }

  Future<void> savePhotosToFirestore() async {
    try {
      setState(ViewModelState.busy);
      final user = FirebaseAuth.instance.currentUser!;

      await _firestore.collection('users').doc(user.uid).update({
        'photos': photos,
        'profileComplete': true,
      });

    } catch (e) {
      debugPrint('Erreur lors de la sauvegarde: $e');
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