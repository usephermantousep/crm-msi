part of 'screen.dart';

class MainPage extends StatelessWidget {
  final controller = Get.put(MainPageController());
  final c = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: 'FAFAFC'.toColor(),
            ),
          ),
          SafeArea(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.swipePage(index);
              },
              children: [
                Center(
                  child: HomePage(),
                ),
                Center(
                  child: ListRegisterNoo(),
                ),
                Center(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GetBuilder<MainPageController>(
              builder: (_) {
                return CustomBottomNavBar(
                  onTap: (index) {
                    controller.chaneNavbarBottom(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
