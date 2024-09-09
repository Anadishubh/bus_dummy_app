import 'package:bms/View/Screens/booking/booking.dart';
import 'package:bms/View/Screens/booking/booking_details.dart';
import 'package:bms/View/Screens/bottombar/bottom_bar.dart';
import 'package:bms/View/Screens/login/login_page.dart';
import 'package:bms/View/Screens/offers/offers.dart';
import 'package:bms/View/Screens/passenger/new_passengers.dart';
import 'package:bms/View/Screens/passenger/passengers.dart';
import 'package:bms/View/Screens/personal%20information/personalinfo.dart';
import 'package:bms/View/Screens/refer/referal.dart';
import 'package:bms/View/Screens/search/search_page.dart';
import 'package:bms/View/Screens/start/start_page.dart';
import 'package:bms/View/Screens/wallet/wallet.dart';
import 'package:get/get.dart';
import '../View/Screens/Splash/splash_screen.dart';
import '../View/Screens/offers/offer2.dart';

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
  static const String search = '/search';
  static const String profile = '/personal';
  static const String passengers = '/passenger';
  static const String newPassengers = '/newPassenger';
  static const String wallet = '/wallet';
  static const String refer = '/refer';
  static const String offer = '/offer';
  static const String offer2 = '/offer2';
  static const String booking = '/booking';
  static const String bookingDetails = '/bookingDetails';

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
    GetPage(
      name: search,
      page: () => const SearchPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profile,
      page: () => const PersonalInfo(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: passengers,
      page: () =>  const Passengers(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: newPassengers,
      page: () => const NewPassengers(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: wallet,
      page: () => const Wallet(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: refer,
      page: () =>  Referral(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: offer,
      page: () =>  Offers(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: offer2,
      page: () =>  Offer2(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: booking,
      page: () =>  Booking(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: bookingDetails,
      page: () =>  BookingDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
