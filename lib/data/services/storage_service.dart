import 'dart:convert';
import 'dart:ui';

import 'package:chat_app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box = GetStorage();
  final String _localeKey = "locale";
  final String _userKey = "user";

  saveLanguage(Locale locale) {
    _box.write(_localeKey, "${locale.languageCode}_${locale.countryCode}");
  }

  saveUser(UserModel userModel) {
    _box.write(_userKey, jsonEncode(userModel.toJson()));
  }

  UserModel? getUser() {
    String? user = _box.read(_userKey);
    if (user != null) {
      return UserModel.fromJson(jsonDecode(user));
    } else {
      return null;
    }
  }

  Locale? getLanguage() {
    String? locale = _box.read(_localeKey);
    if (locale != null) {
      return Locale(locale.split("_")[0]);
    } else {
      return null;
    }
  }
}
