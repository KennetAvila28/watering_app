import 'package:watering_system/presentation/widgets/custom_page_controller.dart';

enum HomePages {
  homeScreen,
  scannerScreen,
  shoppingCartScreen,
  moreLookScreen,
  productsScreen,
  promotionsScreen,
  favoritesScreen,
  profileScreen,
}

class HomePagesController {
  late final CustomPageController controller;
  List<int> stakPages = [];

  HomePagesController() {
    _initHomePagesController();
  }

  _initHomePagesController() {
    controller = CustomPageController();
  }

  showProductScreen() {
    stakPages.add(HomePages.productsScreen.index);
    controller.jumpToPageCustom(HomePages.productsScreen.index);
  }

  showPromotionsScreen() {
    stakPages.add(HomePages.promotionsScreen.index);
    controller.jumpToPageCustom(HomePages.promotionsScreen.index);
  }

  showFavoritesScreen() {
    stakPages.add(HomePages.favoritesScreen.index);
    controller.jumpToPageCustom(HomePages.favoritesScreen.index);
  }

  showProfileScreen() {
    stakPages.add(HomePages.profileScreen.index);
    controller.jumpToPageCustom(HomePages.profileScreen.index);
  }

  int backPage() {
    stakPages.removeLast();
    controller.jumpToPageCustom(stakPages.last);
    return stakPages.last;
  }

  addPage(HomePages page) {
    stakPages.add(page.index);
    controller.jumpToPageCustom(page.index);
  }

  resetStack() {
    stakPages.clear();
    stakPages.add(0);
    controller.jumpToPageCustom(0);
  }
}
