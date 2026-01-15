import 'package:get/get.dart';
import '../splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
  ];
}
