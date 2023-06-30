import 'package:get/route_manager.dart';
import '../pages/home/view/home_screen.dart';
import '../pages/login/view/login_screen.dart';
import '../pages/user/user_screen.dart';

class Routes {
  static const String _login = "/";
  static const String _home = '/home';
  static const String _user = '/home/user';

  static String getLoginRoute() => _login;
  static String getHomeRoute() => _home;
  static String getUserRoute() => _user;

  static List<GetPage> routes = [
    GetPage(
      name: getLoginRoute(),
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: getHomeRoute(),
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: getUserRoute(),
      page: () => const UsuarioScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
