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
                            image: NetworkImage((controller
                                        .user!.profilePhotoPath ==
                                    null)
                                ? 'https://msis.co.id/wp-content/uploads/2021/08/Logo-MSI-Media-Selular-Indonesia-1024x570.png'
                                : controller.user!.profilePhotoPath!),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.user!.namaLengkap!,
                    style: blackFontStyle1,
                  ),
                  Text(
                    controller.user!.cluster!.namaCluster!,
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
                      titles: ["Outlet", "Noo"],
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
                                MenuAccount(
                                  title: "Outlet Total",
                                  count: con.outlets!.length.toString(),
                                  onpress: () {},
                                  mdiIcons: MdiIcons.storefront,
                                ),
                                MenuAccount(
                                    title: "Visited Today",
                                    onpress: () {},
                                    mdiIcons: MdiIcons.naturePeople,
                                    count: controller.visit!.length.toString()),
                                Divider(),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      con.logout().then((value) => value
                                          ? Get.offAll(() => LoginPage())
                                          : con.showError(
                                              'gagal', 'logout gagal'));
                                    },
                                    child: MenuAccount(
                                      title: "Log Out",
                                      mdiIcons: MdiIcons.logout,
                                      onpress: () {
                                        con.logout().then((value) => value
                                            ? Get.offAll(() => LoginPage())
                                            : con.showError(
                                                'gagal', 'logout gagal'));
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : GetBuilder<ListNooController>(
                            builder: (connoo) => Column(
                              children: [
                                MenuAccount(
                                  title: "Registered",
                                  count: connoo.noos
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
                                  count: connoo.noos
                                      .where((element) =>
                                          element.status! ==
                                          NooStatus.confirmed)
                                      .toList()
                                      .length
                                      .toString(),
                                  mdiIcons: MdiIcons.fileCheck,
                                  onpress: () {},
                                ),
                                MenuAccount(
                                  title: "Approved",
                                  count: connoo.noos
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
                                  count: connoo.noos
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
