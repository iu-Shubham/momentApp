import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task2_t2/app/modules/home/controllers/home_controller.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import '../../../constants/image_constant.dart';
import '../../../services/text_style_util.dart';

class HourlyWeather extends GetView<HomeController> {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final HomeController controller = HomeController();
    Get.lazyPut(() => HomeController());
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
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 116.kh,
                  width: 64.kw,
                  margin: EdgeInsets.only(right: 12.kw, bottom: 12.kh),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Card(
                    color: Color(0xFF2C2C2E),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => Text(
                            '${controller.Model.value?.hourly?.time?[0]}' ?? '',
                            style: TextStyleUtil.SFPro400(fontSize: 14),
                          ),
                        ),
                        SvgPicture.asset(ImageConstant.svgsunrise),
                        Obx(
                          () => Text(
                            '${controller.Model.value?.hourly?.temperature2m?[0].toInt()}°C' ??
                                '',
                            style: TextStyleUtil.SFPro400(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
