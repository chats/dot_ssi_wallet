import 'package:get/get.dart';

class HomeController extends GetxController {
  bool searchActive = false.obs as bool;

  void setSearchActive(bool value) {
    searchActive = value;
    update();
  }
}
