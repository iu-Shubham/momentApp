import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task2_t2/app/modules/home/views/hourly_weather_view.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import 'package:task2_t2/generated/locales.g.dart';
import '../../../constants/image_constant.dart';
import '../../../services/colors.dart';
import '../../../services/text_style_util.dart';
import '../controllers/home_controller.dart';

class TodayView extends GetView<HomeController> {
  const TodayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
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
                          LocaleKeys.clear.tr,
                          style: TextStyleUtil.SFPro400(fontSize: 17.kh),
                        ),
                      ],
                    ),
                  ],
                ).paddingOnly(bottom: 16.0.kh),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        '${controller.apiModel.value?.currentWeather?.temperature?.toInt()}°C',
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
                                '${controller.apiModel.value?.daily?.temperature2mMax?[0]}',
                                style: TextStyleUtil.SFPro400(
                                    fontSize: 15.kh,
                                    color: ColorConstant.Opacity60),
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 32.0.kh),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: ColorConstant.Opacity60,
                            ),
                            Obx(
                              () => Text(
                                '${controller.apiModel.value?.daily?.temperature2mMin?[0].toString()}',
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
                Divider(
                  thickness: 1.0,
                  color: ColorConstant.Opacity30,
                ).paddingSymmetric(vertical: 8.0.kh),
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
                                '${controller.apiModel.value?.hourly?.precipitation?[0]}',
                                style: TextStyleUtil.SFPro400(
                                  fontSize: 17,
                                  color: ColorConstant.Opacity60,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingOnly(bottom: 10.0),
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
                              '${controller.apiModel.value?.currentWeather?.windspeed.toString()}',
                              style: TextStyleUtil.SFPro400(
                                fontSize: 17,
                                color: ColorConstant.Opacity60,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.details.tr,
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
          ).paddingOnly(bottom: 16.0),
          HourlyWeather(),
        ],
      ).paddingSymmetric(horizontal: 16.0, vertical: 16.0),
    );
  }
}
