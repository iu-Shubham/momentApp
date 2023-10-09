import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2_t2/app/modules/SPLASH/controllers/splash_controller.dart';
import 'package:task2_t2/app/services/responsive_size.dart';

import '../modules/five_days_ahead/views/five_days_ahead_view.dart';
import '../modules/home/views/today_view.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // give the tab bar a height [can change height to preferred height]
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
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    7.0,
                  ),
                  color: Color(0xFF636366),
                ),
                // indicatorColor: Colors.blue,
                labelColor: Colors.white,
                unselectedLabelColor: Color(0xFFFFFFFF),
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'today'.tr,
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: '5_days_ahead'.tr,
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // first tab bar view widget
                  TodayView(),
                  FiveDaysAheadView(),
                ],
              ),
            ),
          ],
        ).paddingOnly(top: 18.0),
      ),
    );
  }
}
