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
            _header(),
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
                            ? "OUTLET"
                            : "MENU",
                        "NOO"
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
                                        count: (con.outlets == null)
                                            ? ''
                                            : con.outlets!.length.toString(),
                                        onpress: () {
                                          Get.to(() => ListOutlet());
                                        },
                                        mdiIcons: MdiIcons.storefront,
                                      )
                                    : (controller.role == 1)
                                        ? MenuAccount(
                                            onpress: () {
                                              _bottomSheet(context);
                                            },
                                            title: "All Outlet",
                                            count: "",
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
                                (controller.role == 1 || controller.role == 2)
                                    ? GetBuilder<ProfileController>(
                                        id: 'monitor',
                                        builder: (_) => MenuAccount(
                                          onpress: () {
                                            Get.to(
                                              () => ListMonitorVisit(),
                                            );
                                          },
                                          title: 'Monitoring Visit',
                                          mdiIcons: MdiIcons.map,
                                          count:
                                              (controller.visitMonitor == null)
                                                  ? '0'
                                                  : '',
                                        ),
                                      )
                                    : SizedBox(),
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

  _header() {
    return Container(
      height: 212,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            margin: EdgeInsets.only(top: 28),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/photo_border.png'),
                ),
                color: Colors.white),
            child: Container(
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/sam.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Sales Assistant Mobile',
            style: blackFontStyle1.copyWith(fontSize: 20),
          ),
          SizedBox(height: 5),
          Text(
            'V1.0.2',
            style: greyFontStyle,
          )
        ],
      ),
    );
  }

  _bottomSheet(BuildContext context) {
    return Get.bottomSheet(
      GetBuilder<ProfileController>(
        id: 'dropdown',
        builder: (_) => Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 2,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(
                      nama: "Pilih Divisi Outlet",
                      width: double.infinity,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: DropdownSearch<String>(
                        emptyBuilder: (context, message) => Center(
                          child: Text("Tidak ada daftar"),
                        ),
                        showSearchBox: true,
                        searchBoxStyle: blackFontStyle2,
                        hint: "Cari Divisi....",
                        items: controller.divisi!.map((e) => e.name!).toList(),
                        popupItemBuilder: (_, item, __) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            item,
                            style: blackFontStyle2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        onChanged: (String? value) async {
                          if (value != null) {
                            controller.selectedDivisi = null;
                            controller.selectedRegion = null;
                            controller.region = [];
                            controller.selectedDivisi = value;
                            await controller
                                .getRegion(controller.selectedDivisi!)
                                .then((value) => controller.region = value);

                            controller.updateManual();
                          }
                        },
                        searchBoxDecoration: InputDecoration(
                          hintText: "Cari Divisi ...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(
                      nama: "Pilih Region Outlet",
                      width: double.infinity,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: DropdownSearch<String>(
                        emptyBuilder: (context, message) => Center(
                          child: Text("Tidak ada daftar"),
                        ),
                        showSearchBox: true,
                        searchBoxStyle: blackFontStyle2,
                        hint: "Cari Region....",
                        items: (controller.region != null)
                            ? controller.region!.map((e) => e.name!).toList()
                            : [],
                        popupItemBuilder: (_, item, __) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            item,
                            style: blackFontStyle2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        onChanged: (String? value) async {
                          if (value != null) {
                            controller.selectedRegion = null;
                            controller.selectedRegion = value;
                            controller.updateManual();
                          }
                        },
                        searchBoxDecoration: InputDecoration(
                          hintText: "Cari Region ...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: () async {
                  if (controller.selectedDivisi != null &&
                      controller.selectedRegion != null) {
                    Get.back();
                    controller.loading();
                    await controller
                        .getDataOutlet(
                      region: controller.selectedRegion,
                      divisi: controller.selectedDivisi,
                    )
                        .then(
                      (value) async {
                        Get.back();
                        if (value) {
                          Get.to(() => ListOutlet());
                        }
                        ;
                      },
                    );
                    controller.selectedDivisi = null;
                    controller.selectedRegion = null;
                  } else {
                    controller.notif("Salah", "pilih divisi dan region dahulu");
                  }
                },
                child: Text(
                  'OK',
                  style: blackFontStyle3.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
