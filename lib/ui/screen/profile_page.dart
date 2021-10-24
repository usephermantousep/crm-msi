part of 'screen.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 232,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    margin: EdgeInsets.only(top: 28),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/photo_border.png'),
                        ),
                        color: Colors.white),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage((controller.badanUsaha == 1)
                                ? 'assets/msilogo.png'
                                : (controller.badanUsaha == 2)
                                    ? 'assets/toplogo.png'
                                    : 'assets/msilogo.png'),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.badanUsaha == 1
                        ? 'PT.MSI'
                        : controller.badanUsaha == 1
                            ? 'CV.TOP'
                            : 'PT.MSI',
                    style: blackFontStyle1,
                  ),
                  Text(
                    'Grosir App V1.0.0',
                    style: greyFontStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<ProfileController>(
                    id: 'tab',
                    builder: (cons) => CustomTabBar(
                      titles: [
                        (controller.role == 2 || controller.role == 3)
                            ? "Outlet"
                            : "Menu",
                        "Noo"
                      ],
                      selectedIndex: cons.selectedIndex,
                      onTap: (int index) {
                        cons.changePage(index);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GetBuilder<ProfileController>(
                    id: 'tab',
                    builder: (con) => (con.selectedIndex == 0)
                        ? GetBuilder<ProfileController>(
                            id: 'outlet',
                            builder: (_) => Column(
                              children: [
                                (controller.role == 2 || controller.role == 3)
                                    ? MenuAccount(
                                        title: "Outlet Total",
                                        count: con.outlets!.length.toString(),
                                        onpress: () {},
                                        mdiIcons: MdiIcons.storefront,
                                      )
                                    : Container(),
                                (controller.role == 1 ||
                                        controller.role == 2 ||
                                        controller.role == 3)
                                    ? MenuAccount(
                                        title: "Visited Today",
                                        onpress: () {},
                                        mdiIcons: MdiIcons.naturePeople,
                                        count:
                                            controller.visit!.length.toString(),
                                      )
                                    : SizedBox(),
                                Divider(),
                                Container(
                                  child: MenuAccount(
                                    title: "Log Out",
                                    mdiIcons: MdiIcons.logout,
                                    onpress: () {
                                      con.logout().then(
                                        (value) {
                                          if (value) {
                                            Get.delete<MainPageController>();
                                            Get.delete<HomePageController>();
                                            Get.delete<ProfileController>();
                                            Get.delete<ListNooController>();
                                            Get.offAll(() => LoginPage());
                                          } else {
                                            con.showError(
                                                'gagal', 'logout gagal');
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : GetBuilder<ListNooController>(
                            builder: (_) => Column(
                              children: [
                                MenuAccount(
                                  title: "Registered",
                                  count: _.noos
                                      .where((element) =>
                                          element.status! == NooStatus.pending)
                                      .toList()
                                      .length
                                      .toString(),
                                  mdiIcons: MdiIcons.fileRefresh,
                                  onpress: () {
                                    Get.to(
                                      () => MainPage(),
                                    );
                                  },
                                ),
                                MenuAccount(
                                  title: "Confirmed",
                                  count: _.noos
                                      .where((element) =>
                                          element.status! ==
                                          NooStatus.confirmed)
                                      .toList()
                                      .length
                                      .toString(),
                                  mdiIcons: MdiIcons.checkAll,
                                  onpress: () {},
                                ),
                                MenuAccount(
                                  title: "Approved",
                                  count: _.noos
                                      .where((element) =>
                                          element.status! == NooStatus.approved)
                                      .toList()
                                      .length
                                      .toString(),
                                  mdiIcons: MdiIcons.checkAll,
                                  onpress: () {},
                                ),
                                MenuAccount(
                                  title: "Rejected",
                                  count: _.noos
                                      .where((element) =>
                                          element.status! == NooStatus.rejected)
                                      .toList()
                                      .length
                                      .toString(),
                                  mdiIcons: MdiIcons.fileRemove,
                                  onpress: () {},
                                ),
                              ],
                            ),
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
