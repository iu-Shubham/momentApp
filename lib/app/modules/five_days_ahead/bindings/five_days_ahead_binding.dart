import 'package:get/get.dart';

import '../controllers/five_days_ahead_controller.dart';

class FiveDaysAheadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FiveDaysAheadController>(
      () => FiveDaysAheadController(),
    );
  }
}
