import 'package:chat_app/ui/pages/chat_page/chat_page.dart';
import 'package:chat_app/ui/pages/language_page/language_page.dart';
import 'package:chat_app/ui/pages/login_page/login_page.dart';
import 'package:chat_app/ui/pages/profile_page/profile_page.dart';
import 'package:chat_app/ui/pages/register_page/register_page.dart';
import 'package:chat_app/ui/pages/splash_page/splash_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String splashPage = "/splashPage";
  static const String languagePage = "/languagePage";
  static const String loginPage = "/loginPage";
  static const String registerPage = "/registerPage";
  static const String chatPage = "/chatPage";
  static const String profilePage = "/ProfilePage";

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
      case AppRoutes.registerPage:
        return CupertinoPageRoute(
          builder: (context) => RegisterPage(),
        );
      case AppRoutes.chatPage:
        return CupertinoPageRoute(
          builder: (context) => ChatPage(),
        );
      case AppRoutes.profilePage:
        return CupertinoPageRoute(
          builder: (context) => ProfilePage(),
        );
    }
    return null;
  }
}
