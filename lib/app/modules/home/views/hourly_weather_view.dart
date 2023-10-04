import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task2_t2/app/modules/home/controllers/home_controller.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import '../../../constants/image_constant.dart';
import '../../../services/text_style_util.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    DateTime now = DateTime.now();
    DateTime next24hours = now.add(Duration(hours: 24));
    // List<DateTime> hours = [];
    // for (int i = 0; i < 24; i++) {
    //   hours.add(now.add(Duration(hours: i)));
    // }

    return Container(
      padding: EdgeInsets.only(left: 24.kw, top: 24.kh, bottom: 16.kh),
      width: 492.kw,
      height: 202.kh,
      decoration: BoxDecoration(
        color: Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hourly weather',
            style: TextStyleUtil.SFPro600(fontSize: 17),
          ),
          8.kheightBox,
          Obx(
            () => Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.Model.value?.hourly?.time?.length ?? 24,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final hourlyTime = DateTime.parse(
                      controller.Model.value?.hourly?.time?[index] ??
                          DateTime.now().toString());
//
//                 DateTime hour = hours[index];
//
                  if (hourlyTime.isAfter(now) &&
                      hourlyTime.isBefore(next24hours)) {
                    final String timeToImage =
                        hourlyTime.hour >= 6 && hourlyTime.hour < 12
                            ? ImageConstant.svgsunrise
                            : hourlyTime.hour >= 12 && hourlyTime.hour < 18
                                ? ImageConstant.svgfullsun
                                : hourlyTime.hour >= 18 && hourlyTime.hour < 21
                                    ? ImageConstant.svgMoon
                                    : ImageConstant.svgcloudmoon;

                    return Container(
                      height: 116.kh,
                      width: 64.kw,
                      margin: EdgeInsets.only(right: 12.kw, bottom: 12.kh),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Card(
                        color: Color(0xFF2C2C2E),
                        child: Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${hourlyTime.hour}:00',
                                style: TextStyleUtil.SFPro400(fontSize: 14),
                              ),
                              SvgPicture.asset(timeToImage),
                              Text(
                                '${controller.Model.value?.hourly?.temperature2m?[index].toInt()}°C',
                                style: TextStyleUtil.SFPro400(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                  // }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
