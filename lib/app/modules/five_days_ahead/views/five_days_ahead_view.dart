import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import '../../../constants/image_constant.dart';
import '../../../services/colors.dart';
import '../../../services/text_style_util.dart';
import '../../home/controllers/home_controller.dart';

class FiveDaysAheadView extends StatelessWidget {
  const FiveDaysAheadView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final dailyTime = controller.Model.value?.daily?.time?[index];
            final dateTime = DateTime.parse(dailyTime!);
            final now = DateTime.now();
            final today = DateTime(now.year, now.month, now.day);
            final nextDates = DateFormat('dd MMM').format(dateTime);
            bool isToday = dateTime == today;
            final todaysDate = isToday ? 'Today' : nextDates;

            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: isToday
                        ? LinearGradient(
                            begin: AlignmentDirectional.topCenter,
                            end: AlignmentDirectional.bottomCenter,
                            colors: [
                                Color(0xFF062D66),
                                Color(0xFF0B2C6C),
                                Color(0xFF04245D),
                                Color(0xFF123F5F),
                                //       Color(0xFF316477),
                              ])
                        : null,
                    color: dateTime == today ? null : Color(0xff1C1C1E),
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
                            // 'Today',
                            '${todaysDate}',
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
                                '${controller.Model.value?.daily!.temperature2mMax?[index]}°C',
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
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              ImageConstant.svgdrop),
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
                                          SvgPicture.asset(
                                              ImageConstant.svgwave),
                                          Text(
                                            '${controller.Model.value?.hourly?.precipitation?[index]}',
                                            //daily me precipitation not available in the model
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              ImageConstant.svgwind),
                                          Obx(
                                            () => Text(
                                              // '${controller.Model.value?.daily!.weathercode?[index]} m/s',
                                              '${controller.Model.value?.hourly!.windspeed10m?[index]}',
                                              // windspeed daily not in model
                                              style: TextStyleUtil.SFPro400(
                                                fontSize: 13,
                                                color: ColorConstant.Opacity60,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingOnly(top: 16.0, left: 16.0, right: 16.0);
          },
        ),
      ),
    );
  }
}
