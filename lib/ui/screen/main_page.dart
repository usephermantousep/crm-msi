part of 'screen.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => Scaffold(
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
                      child: Container(
                    child: Text("kedua"),
                  )
                      // ListRegisterNoo(),
                      ),
                  Center(
                      child: Container(
                    child: Text("ketiga"),
                  )
                      // ProfilePage(),
                      ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavBar(
                selectedIndex: controller.selectedPage!,
                onTap: (index) {
                  controller.chaneNavbarBottom(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
