import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task2_t2/app/modules/home/views/hourly_weather_view.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import '../../../constants/image_constant.dart';
import '../../../services/colors.dart';
import '../../../services/text_style_util.dart';
import '../controllers/home_controller.dart';

class TodayView extends GetView<HomeController> {
  const TodayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 262.kh,
                  width: 361.kw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [
                          Color(0xFF062D66),
                          Color(0xFF0B2C6C),
                          Color(0xFF04245D),
                          Color(0xFF123F5F),
                          // Color(0xFF316477),
                        ]),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                width: 80.kw,
                                height: 22.kh,
                                child: Center(
                                  child: Obx(
                                    () => Text(
                                      controller.currentCity.value,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.kh),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstant.svgMoonwhite),
                              Text(
                                'Clear',
                                style: TextStyleUtil.SFPro400(fontSize: 17.kh),
                              ),
                            ],
                          ),
                        ],
                      ),
                      16.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              '${controller.Model.value?.currentWeather?.temperature?.toInt()}°C',
                              // '20',
                              style: TextStyleUtil.SFPro400(fontSize: 80.kh),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_upward,
                                    color: ColorConstant.Opacity60,
                                  ),
                                  Obx(
                                    () => Text(
                                      '${controller.Model.value?.daily?.temperature2mMax?[0]}' ??
                                          '',
                                      style: TextStyleUtil.SFPro400(
                                          fontSize: 15.kh,
                                          color: ColorConstant.Opacity60),
                                    ),
                                  ),
                                ],
                              ),
                              32.kheightBox,
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: ColorConstant.Opacity60,
                                  ),
                                  Obx(
                                    () => Text(
                                      '${controller.Model.value?.daily?.temperature2mMin?[0].toString()}' ??
                                          '',
                                      style: TextStyleUtil.SFPro400(
                                          fontSize: 15.kh,
                                          color: ColorConstant.Opacity60),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.kheightBox,
                      Divider(
                        thickness: 1.0,
                        color: ColorConstant.Opacity30,
                      ),
                      10.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstant.svgdrop),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 4.0,
                                ),
                                child: Text('30%',
                                    style: TextStyleUtil.SFPro400(
                                      fontSize: 17,
                                      color: ColorConstant.Opacity60,
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstant.svgwave),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 4.0,
                                ),
                                child: Obx(
                                  () => Text(
                                      '${controller.Model.value?.hourly?.precipitation?[0]}',
                                      style: TextStyleUtil.SFPro400(
                                        fontSize: 17,
                                        color: ColorConstant.Opacity60,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstant.svgwind),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 4.0,
                                ),
                                child: Obx(
                                  () => Text(
                                    '${controller.Model.value?.currentWeather?.windspeed.toString()} m/s',
                                    style: TextStyleUtil.SFPro400(
                                      fontSize: 17,
                                      color: ColorConstant.Opacity60,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // 165.kwidthBox,
                          Row(
                            children: [
                              Text(
                                'Details',
                                style: TextStyleUtil.SFPro400(
                                  fontSize: 17,
                                  color: ColorConstant.Opacity60,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                color: ColorConstant.Opacity60,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              16.kheightBox,
              HourlyWeather(),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
