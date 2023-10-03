import 'package:get/get.dart';

import '../components/my_tab_bar.dart';
import '../modules/SPLASH/bindings/splash_binding.dart';
import '../modules/SPLASH/views/splash_view.dart';
import '../modules/five_days_ahead/bindings/five_days_ahead_binding.dart';
import '../modules/five_days_ahead/views/five_days_ahead_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/today_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => CustomTabBar(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.FIVE_DAYS_AHEAD,
      page: () => const FiveDaysAheadView(),
      binding: FiveDaysAheadBinding(),
    ),
  ];
}
