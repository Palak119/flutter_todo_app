import 'package:get/get.dart';

import '../../controllers/other/demo_ui_screen_controller.dart';

class DemoUIScreenBinding extends Bindings{
@override
  void dependencies() {
    Get.lazyPut<DemoUIScreenController>(() => DemoUIScreenController());
  }
}