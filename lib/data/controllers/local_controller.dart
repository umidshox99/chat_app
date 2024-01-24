import 'dart:ui';

import 'package:chat_app/data/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  var _locale = Get.deviceLocale!.obs;
  final StorageService storageService;

  LocaleController(this.storageService);

  Rx<Locale> get locale => _locale;

  changeLanguage(Locale locale) {
    // "uz_UZ"
    this._locale.value = locale;
    storageService.saveLanguage(locale);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    var locale = storageService.getLanguage();
    if (locale != null) {
      _locale.value = locale;
    } else {
      _locale.value = Get.deviceLocale!;
    }
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
