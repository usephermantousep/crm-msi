part of 'controllers.dart';

class MainPageController extends GetxController {
  int selectedPage = 0;
  PageController? pageController;

  void swipePage(int index) {
    selectedPage = index;
    update(['bottomnavbar']);
  }

  void chaneNavbarBottom(int index) {
    selectedPage = index;
    pageController!.jumpToPage(selectedPage);
    update(['bottomnavbar']);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedPage);
    update();
    super.onInit();
  }
}
