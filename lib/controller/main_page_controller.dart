part of 'controllers.dart';

class MainPageController extends GetxController {
  int? selectedPage;
  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    selectedPage = 1;
    super.onInit();
  }

  void swipePage(int index) {
    selectedPage = index;
    update();
  }

  void chaneNavbarBottom(int index) {
    selectedPage = index;
    pageController.jumpToPage(selectedPage!);
    update();
  }
}
