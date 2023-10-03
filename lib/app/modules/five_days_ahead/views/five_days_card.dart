import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import 'package:get/get.dart';
import '../../../constants/image_constant.dart';
import '../../../services/colors.dart';
import '../../../services/text_style_util.dart';
import '../../home/controllers/home_controller.dart';

class FiveDaysCard extends StatelessWidget {
  const FiveDaysCard({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController();
    Get.lazyPut(() => HomeController());
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 120.kh,
          width: 361.kw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xff1C1C1E),
            // gradient: const LinearGradient(
            //     begin: AlignmentDirectional.topCenter,
            //     end: AlignmentDirectional.bottomCenter,
            //     colors: [
            //
            //       // Color(0xFF062D66),
            //       // Color(0xFF0B2C6C),
            //       // Color(0xFF04245D),
            //       // Color(0xFF123F5F),
            //       // Color(0xFF316477),
            //     ]),
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
                            border: Border.all(color: Colors.white, width: 1)),
                        width: 80.kw,
                        height: 22.kh,
                        child: Center(
                          child: Obx(
                            () => Text(
                              controller.currentCity.value,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.kh),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Today',
                    style: TextStyleUtil.SFPro400(fontSize: 17.kh),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Obx(
                      () => Text(
                        '${controller.Model.value?.currentWeather?.temperature?.toInt()}°C',
                        style: TextStyleUtil.SFPro400(fontSize: 40.kh),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    height: 40,
                    width: 1.0,
                    color: ColorConstant.Opacity30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstant.svgdrop),
                              Text(
                                '30%',
                                style: TextStyleUtil.SFPro400(
                                  fontSize: 13,
                                  color: ColorConstant.Opacity60,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstant.svgwave),
                              Obx(
                                () => Text(
                                  '${controller.Model.value?.hourly?.precipitation?[0].toInt()}',
                                  style: TextStyleUtil.SFPro400(
                                    fontSize: 13,
                                    color: ColorConstant.Opacity60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      12.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(ImageConstant.svgwind),
                              Obx(
                                () => Text(
                                  '${controller.Model.value?.currentWeather?.windspeed.toString()} m/s',
                                  style: TextStyleUtil.SFPro400(
                                    fontSize: 13,
                                    color: ColorConstant.Opacity60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Row(
                              children: [
                                Text(
                                  'Details',
                                  style: TextStyleUtil.SFPro400(
                                    fontSize: 13,
                                    color: ColorConstant.Opacity60,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: ColorConstant.Opacity60,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 8.0),
            ],
          ),
        ).paddingOnly(top: 16.0)
      ],
    );
  }
}
