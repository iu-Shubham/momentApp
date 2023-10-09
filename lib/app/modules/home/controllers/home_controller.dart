import 'dart:ffi';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../generated/locales.g.dart';
import '../../../services/dio/api_service.dart';
import '../../../weather model/WeatherData.dart';

class HomeController extends GetxController {
  Rxn<WeatherData> apiModel = Rxn();
  RxString currentCity = "".obs;
  var weatherData = {}.obs;
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  DateTime now = DateTime.now();
  DateTime next24hours = DateTime.now().add(const Duration(hours: 24));

  bool today(int index) {
    final dailyTime = apiModel.value?.daily?.time?[index];
    final dateTime = DateTime.parse(dailyTime!);
    final day = DateTime(now.year, now.month, now.day);
    bool isToday = dateTime == day;
    return isToday;
  }

  String todaysDate(int index) {
    final dailyTime = apiModel.value?.daily?.time?[index];
    final dateTime = DateTime.parse(dailyTime!);
    final nextDates = DateFormat('MMM dd').format(dateTime);
    final currentDate = today(index) ? LocaleKeys.today.tr : nextDates;
    return currentDate;
  }

  Future<void> getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission == await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permissions is denied");
      }
    }

    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude.value = position.latitude;
      longitude.value = position.longitude;
      isLoading.value = false;

      await placemarkFromCoordinates(latitude.value, longitude.value)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        currentCity.value = place.locality ?? '';
        print(place);
        print(latitude);
        print(longitude);
      });
    } catch (e) {
      print(('error: $e'));
    }
  }

  Future<void> fetchCurrentData() async {
    try {
      APIManager.getcurrentweatherdata(
        latitude: latitude.toString(),
        longitude: longitude.toString(),
      ).then((value) => {
            apiModel.value = WeatherData.fromJson(value.data),
          });
    } catch (e) {
      print('$e');
    }
  }

  Future<void> methodData() async {
    await getLocation();
    await fetchCurrentData();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    methodData();
  }
}
