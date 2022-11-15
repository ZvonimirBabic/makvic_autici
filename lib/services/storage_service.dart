import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'logger_service.dart';

class StorageService extends GetxService {
  final logger = Get.find<LoggerService>();

  ///
  /// VARIABLES
  ///

  late final storageBox = GetStorage();

  ///
  /// METHODS
  ///

  Future<void> insertValue({required String key, required value}) async {
    await storageBox.write(key, value);

    logger
      ..v('STORAGE')
      ..v('--------------------')
      ..v('Value inserted\nKey: $key\nValue: $value')
      ..v('--------------------\n');
  }

  String getString({required String key, String defaultValue = ''}) {
    final value = storageBox.read(key) ?? defaultValue;

    logger
      ..v('STORAGE')
      ..v('--------------------')
      ..v('String fetched\nKey: $key\nValue: $value')
      ..v('--------------------\n');

    return value;
  }

  int getInt({required String key, int defaultValue = -1}) {
    final value = storageBox.read(key) ?? defaultValue;

    logger
      ..v('STORAGE')
      ..v('--------------------')
      ..v('Int fetched\nKey: $key\nValue: $value')
      ..v('--------------------\n');

    return value;
  }

  bool getBool({required String key, bool defaultValue = false}) {
    final value = storageBox.read(key) ?? defaultValue;

    logger
      ..v('STORAGE')
      ..v('--------------------')
      ..v('Bool fetched\nKey: $key\nValue: $value')
      ..v('--------------------\n');

    return value;
  }

  bool doesExist({required String key}) => storageBox.hasData(key);

  Future<void> deleteValue({required String key}) async {
    await storageBox.remove(key);

    logger
      ..v('STORAGE')
      ..v('--------------------')
      ..v('Value deleted\nKey: $key')
      ..v('--------------------\n');
  }

  Future<void> deleteAll() async {
    await storageBox.erase();

    logger
      ..v('STORAGE')
      ..v('--------------------')
      ..v('All values deleted')
      ..v('--------------------\n');
  }
}
