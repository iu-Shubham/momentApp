import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task2_t2/app/modules/five_days_ahead/views/five_days_card.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import '../../../constants/image_constant.dart';
import '../../../services/colors.dart';
import '../../../services/text_style_util.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/five_days_ahead_controller.dart';

class FiveDaysAheadView extends GetView<HomeController> {
  const FiveDaysAheadView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final HomeController controller = HomeController();
    // final FiveDaysAheadController controller = FiveDaysAheadController();
    Get.lazyPut(() => HomeController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 120.kh,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '${controller.Model.value?.currentWeather?.temperature!.toInt()}°C',
                                style: TextStyleUtil.SFPro400(fontSize: 40.kh),
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
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    73.kwidthBox,
                                    Row(
                                      children: [
                                        SvgPicture.asset(ImageConstant.svgwave),
                                        Text(
                                          '${controller.Model.value?.hourly?.precipitation?[0]}',
                                          style: TextStyleUtil.SFPro400(
                                            fontSize: 13,
                                            color: ColorConstant.Opacity60,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                12.kheightBox,
                                Row(
                                  children: [
                                    SvgPicture.asset(ImageConstant.svgwind),
                                    Obx(
                                      () => Text(
                                        '${controller.Model.value?.currentWeather?.windspeed.toString()}',
                                        // 'wind',
                                        style: TextStyleUtil.SFPro400(
                                          fontSize: 13,
                                          color: ColorConstant.Opacity60,
                                        ),
                                      ),
                                    ),
                                    53.kwidthBox,
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FiveDaysCard(),
              FiveDaysCard(),
              FiveDaysCard(),
              FiveDaysCard(),
              FiveDaysCard(),
            ],
          ),
        ),
      ),
    );
  }
}
