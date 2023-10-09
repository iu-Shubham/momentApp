import 'package:task2_t2/app/components/languages.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetServices();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  return runApp(GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      defaultTransition: Transition.fade,
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: MyTranslations(),
      translationsKeys: AppTranslation.translations,
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
    ),
  ));
}

Future<void> initGetServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}
