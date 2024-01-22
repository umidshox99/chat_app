import 'package:chat_app/ui/pages/language_page/language_page.dart';
import 'package:chat_app/ui/pages/login_page/login_page.dart';
import 'package:chat_app/ui/pages/splash_page/splash_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String splashPage = "/splashPage";
  static const String languagePage = "/languagePage";
  static const String loginPage = "/loginPage";

  static Route<dynamic>? onGenerateRoute(settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CupertinoPageRoute(
          builder: (context) => SplashPage(),
        );
      case AppRoutes.languagePage:
        return CupertinoPageRoute(
          builder: (context) => LanguagePage(),
        );

      case AppRoutes.loginPage:
        return CupertinoPageRoute(
          builder: (context) => LoginPage(),
        );
    }
    return null;
  }
}
