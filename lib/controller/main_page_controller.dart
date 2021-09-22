part of 'controllers.dart';

class MainPageController extends GetxController {
  int selectedPage = 0;
  PageController? pageController;
  String? role;

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
  void onInit() async {
    pageController = PageController(initialPage: selectedPage);
    update();
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getString('role');
    update(['mode']);
    super.onInit();
  }
}
