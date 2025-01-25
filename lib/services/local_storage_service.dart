import 'dart:async';

import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../app_locator.dart';
import '../constants/enums.dart';
import '../helpers/extensions/enum.dart';
import 'base.service.dart';

class LocalStorageBox {
  Box? _box;

  LocalStorageBox();

  Future<void> openBox(String name) async {
    _box = await Hive.openBox(name);
  }

  Box get box => (_box != null ? _box! : throw Exception("Error Box not opened. Call openBox to open the box."));

  bool isOpen() => box.isOpen;

  bool hasData() => box.isNotEmpty;

  // Get stored elements count
  int dataCount() => box.length;

  // Save data with a key
  Future<void> saveData<T>(String key, T data) async => await box.put(key, data);

  // Save data with auto increment integer key
  Future<void> saveDataAuto<T>(T data) async => await box.add(data);

  // Get data by key
  T? getData<T>(String key) => box.get(key);

  // Get data by key
  Map<dynamic, dynamic> getAllData() => box.toMap();

  // Update stored data
  Future<void> updateData<T>(String key, T Function(T data) func) async {
    T? data = getData(key);
    if (data != null) {
      T updatedData = func(data);
      await saveData(key, updatedData);
    }
  }

  // Check if a key exists
  bool hasKey(String key) => box.containsKey(key);

  // Delete data by key
  Future<void> deleteData(String key) async => await box.delete(key);

  // Delete all data in the box
  Future<void> clearAllData() async => await box.clear();

  // Delete box from disk
  Future<void> deleteFromDisk() async => await box.deleteFromDisk();
}

class LocalStorageService extends BaseService {
  final Map<String, LocalStorageBox> _boxes = {};

  LocalStorageService();

  // init boxes
  Future<void> init() async {
    for (LocalBoxes box in LocalBoxes.values) {
      try {
        await (_boxes[box.toStr] = LocalStorageBox()).openBox(box.toStr);
      } catch (error) {
        locator<Logger>().e(error);
      }
    }
  }

  LocalStorageBox getBox(LocalBoxes box) {
    if (!_boxes.containsKey(box.toStr)) {
      locator<Logger>().e('Box ${box.toStr} is not opened. Call init() to open the box.');
    }
    return _boxes[box.toStr]!;
  }
}