part of 'screen.dart';

class MainPage extends StatelessWidget {
  final controller = Get.put(MainPageController());
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
                GetBuilder<MainPageController>(
                  id: 'mode',
                  builder: (_) => (controller.role == 'SALES')
                      ? HomePage()
                      : Center(
                          child: Text(
                            'Mode Non Sales',
                            style: blackFontStyle1,
                          ),
                        ),
                ),
                ListNooPage(),
                ProfilePage(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GetBuilder<MainPageController>(
              id: 'bottomnavbar',
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
