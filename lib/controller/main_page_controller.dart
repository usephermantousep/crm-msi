part of 'controllers.dart';

class MainPageController extends GetxController {
  int selectedPage = 0;
  PageController? pageController;

  void swipePage(int index) {
    selectedPage = index;
    update();
  }

  void chaneNavbarBottom(int index) {
    selectedPage = index;
    update();
    pageController!.jumpToPage(selectedPage);
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedPage);
    update();
    super.onInit();
  }
}
