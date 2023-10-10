import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task2_t2/app/modules/home/controllers/home_controller.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import '../../../../generated/locales.g.dart';
import '../../../constants/image_constant.dart';
import '../../../services/colors.dart';
import '../../../services/text_style_util.dart';

class TodaysView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(color: Colors.white, width: 1)),
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
                      6.kwidthBox,
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
                      5.kwidthBox,
                      Text('30%',
                          style: TextStyleUtil.SFPro400(
                            fontSize: 17.kh,
                            color: ColorConstant.Opacity60,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(ImageConstant.svgwave),
                      5.kwidthBox,
                      Obx(
                        () => Text(
                            '${controller.apiModel.value?.hourly?.precipitation?[0]}',
                            style: TextStyleUtil.SFPro400(
                              fontSize: 17.kh,
                              color: ColorConstant.Opacity60,
                            )),
                      ),
                    ],
                  ),
                ],
              ).paddingOnly(bottom: 10.0.kh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImageConstant.svgwind),
                      5.kwidthBox,
                      Obx(
                        () => Text(
                          '${controller.apiModel.value?.currentWeather?.windspeed.toString()}',
                          style: TextStyleUtil.SFPro400(
                            fontSize: 17.kh,
                            color: ColorConstant.Opacity60,
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
                          fontSize: 17.kh,
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
        ).paddingOnly(bottom: 16.0.kh), //Today Card

        Container(
          padding: EdgeInsets.only(left: 24.kw, top: 24.kh, bottom: 16.kh),
          width: 492.kw,
          height: 202.kh,
          decoration: BoxDecoration(
            color: const Color(0xff1C1C1E),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.hourly_weather.tr,
                style: TextStyleUtil.SFPro600(fontSize: 17.kh),
              ),
              8.kheightBox,
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        controller.apiModel.value?.hourly?.time?.length ?? 24,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final hourlyTime = DateTime.parse(
                          controller.apiModel.value?.hourly?.time?[index] ??
                              DateTime.now().toString());

                      if (hourlyTime.isAfter(controller.now) &&
                          hourlyTime.isBefore(controller.next24hours)) {
                        final String timeToImage = hourlyTime.hour >= 6 &&
                                hourlyTime.hour < 12
                            ? ImageConstant.svgsunrise
                            : hourlyTime.hour >= 12 && hourlyTime.hour < 18
                                ? ImageConstant.svgfullsun
                                : hourlyTime.hour >= 18 && hourlyTime.hour < 21
                                    ? ImageConstant.svgMoon
                                    : ImageConstant.svgcloudmoon;

                        return Container(
                          margin: EdgeInsets.only(right: 12.kw, bottom: 12.kh),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: const Color(0xFF2C2C2E),
                            child: Obx(
                              () => Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${hourlyTime.hour}:00',
                                    style:
                                        TextStyleUtil.SFPro400(fontSize: 14.kh),
                                  ),
                                  SvgPicture.asset(timeToImage)
                                      .paddingSymmetric(vertical: 8.0),
                                  Text(
                                    '${controller.apiModel.value?.hourly?.temperature2m?[index].toInt()}°C',
                                    style:
                                        TextStyleUtil.SFPro400(fontSize: 14.kh),
                                  ),
                                ],
                              ).paddingAll(16.0.kh),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                      // }
                    },
                  ),
                ),
              ),
            ],
          ),
        ), //Hourly weather view
      ],
    ).paddingSymmetric(horizontal: 16.0.kw, vertical: 16.0.kh);
  }
}
