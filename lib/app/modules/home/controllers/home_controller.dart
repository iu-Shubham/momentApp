import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'package:flutter/material.dart';
import '../../../services/dio/api_service.dart';
import '../../../weather model/WeatherData.dart';

class HomeController extends GetxController {
  Rxn<WeatherData> Model = Rxn();
  RxString currentCity = "".obs;
  var weatherData = {}.obs;
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;

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
      });
    } catch (e) {
      // print(('error: $e'));
    }
  }

  Future<void> fetchCurrentData() async {
    APIManager.getcurrentweatherdata(
      latitude: latitude.toString(),
      longitude: longitude.toString(),
    ).then((value) => {
          Model.value = WeatherData.fromJson(value.data),
          // print(model.hourly?.temperature2m?[0])
        });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCurrentData();
    if (isLoading.isTrue) {
      getLocation();
    }
  }
}
