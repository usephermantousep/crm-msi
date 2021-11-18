part of 'widgets.dart';

class CustomBottomNavBar extends GetView<MainPageController> {
  final Function(int index)? onTap;

  CustomBottomNavBar({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: "FF3F0A".toColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/ic_home' +
                          ((controller.selectedPage == 0)
                              ? '.png'
                              : '_normal.png'),
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Container(
              width: 26,
              height: 26,
              margin: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/ic_order' +
                          ((controller.selectedPage == 1)
                              ? '.png'
                              : '_normal.png'),
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/ic_profile' +
                          ((controller.selectedPage == 2)
                              ? '.png'
                              : '_normal.png'),
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
