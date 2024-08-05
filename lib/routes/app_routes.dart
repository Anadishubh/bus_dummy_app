import 'package:bms/View/Screens/bottombar/bottom_bar.dart';
import 'package:bms/View/Screens/login/login_page.dart';
import 'package:bms/View/Screens/start/start_page.dart';
import 'package:get/get.dart';
import '../View/Screens/Splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String start = '/start';
  static const String login = '/login';
  static const String login2 = '/login2';
  static const String bottom = '/bottom';
  static const String repair = '/repair';
  static const String visit = '/visit';
  static const String faq = '/faq';
  static const String form = '/form';
  static const String mainPage = '/mainPage';

  // static const String dashBoard2 = '/dashboard2';

  static final List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: start,
      page: () => const StartPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
      // transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: bottom,
      page: () =>   const BottomBar(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    // GetPage(
    //   name: repair,
    //   page: () => const RepairMethodologyPage(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(milliseconds: 400),
    // ),
    // GetPage(
    //   name: visit,
    //   page: () => const ArrangeVisitPage(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(milliseconds: 400),
    // ),
    // GetPage(
    //   name: faq,
    //   page: () =>  const FaqPage(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(milliseconds: 400),
    // ),
    // GetPage(
    //   name: form,
    //   page: () => const FormPage(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(milliseconds: 400),
    // ),
    // GetPage(
    //   name: mainpage,
    //   page: () => const DashboardScreen(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(milliseconds: 400),
    // ),
    // GetPage(
    //   name: dashBoard2,
    //   page: () =>  Dashboard2(remainingItems: [],),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(milliseconds: 400),
    // ),
  ];
}
