part of 'controllers.dart';

class MainPageController extends GetxController {
  int selectedPage = 0;
  PageController? pageController;
  int? role;

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
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getInt('role');
    print('ini role ${role}');
    update(['mode']);
    super.onInit();
  }
}
