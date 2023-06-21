import 'package:watering_system/presentation/widgets/custom_page_controller.dart';

enum DevicePages { deviceScreen, reportsScreen, profileScreen }

class DevicesPagesController {
  late final CustomPageController controller;
  List<int> stakPages = [];

  DevicesPagesController() {
    _initDevicePagesController();
  }

  _initDevicePagesController() {
    controller = CustomPageController();
  }

  showReportsScreen() {
    stakPages.add(DevicePages.reportsScreen.index);
    controller.jumpToPageCustom(DevicePages.reportsScreen.index);
  }

  showProfileScreen() {
    stakPages.add(DevicePages.profileScreen.index);
    controller.jumpToPageCustom(DevicePages.profileScreen.index);
  }

  int backPage() {
    stakPages.removeLast();
    controller.jumpToPageCustom(stakPages.last);
    return stakPages.last;
  }

  addPage(DevicePages page) {
    stakPages.add(page.index);
    controller.jumpToPageCustom(page.index);
  }

  resetStack() {
    stakPages.clear();
    stakPages.add(0);
    controller.jumpToPageCustom(0);
  }
}
