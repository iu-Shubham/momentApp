import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2_t2/app/modules/home/views/today_view.dart';
import 'package:task2_t2/app/services/responsive_size.dart';
import 'package:task2_t2/generated/locales.g.dart';

import '../controllers/home_controller.dart';
import 'five_days_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 24.kh,
                width: 365.kw,
                decoration: BoxDecoration(
                  color: Colors.grey[300]?.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    9.0,
                  ),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                    color: Color(0xFF636366),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xFFFFFFFF),
                  tabs: [
                    Tab(
                      text: LocaleKeys.today.tr,
                    ),
                    Tab(
                      text: LocaleKeys.days_ahead.tr,
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  children: [
                    TodaysView(),
                    FiveDaysView(),
                  ],
                ),
              ),
            ],
          ).paddingOnly(top: 18.0),
        ),
      ),
    );
  }
}
