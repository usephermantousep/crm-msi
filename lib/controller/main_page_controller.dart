part of 'controllers.dart';

class MainPageController extends GetxController {
  MainPageController({this.initAfter});
  final int? initAfter;
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
    pageController = PageController(initialPage: initAfter ?? selectedPage);
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getInt('role');
    update(['mode']);
    super.onInit();
  }
}
