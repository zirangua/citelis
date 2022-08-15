import 'package:citelis/ui/photo_screen.dart';
import 'package:citelis/ui/splash_screen.dart';
import 'package:citelis/ui/validar_screen.dart';
import 'package:citelis/ui/video_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../ui/home_screen.dart';
import '../ui/intro_screen.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const createAccount = 'createAccount';
  static const signInEmail = 'signInEmail';
  static const home = '/home';
  static const validar = 'validar';
  static const getPhoto = 'photo';
  static const getVideo = 'video';

  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(settings, page: const SplashScreen());
      case intro:
        return _buildRoute(settings, page: const IntroScreen());
      case home:
        return _buildRoute(settings, page: const HomeScreen());
      case validar:
        return _buildRoute(settings, page: const ValidarScreen());
      case getPhoto:
        return _buildRoute(settings, page: const PhotoScreen());
      case getVideo:
        return _buildRoute(settings, page: const VideoScreen());
      default:
        throw Exception('Ruta no encontrada');
    }
  }

  static GetPageRoute _buildRoute(RouteSettings settings,
          {required Widget page}) =>
      GetPageRoute(settings: settings, page: () => page);
}
