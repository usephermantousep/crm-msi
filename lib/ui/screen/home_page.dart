part of 'screen.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  color: Colors.white,
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<HomePageController>(
                        id: 'profile',
                        builder: (_) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.user == null
                                  ? '-'
                                  : controller.user!.namaLengkap!.toUpperCase(),
                              softWrap: false,
                              style: blackFontStyle1,
                            ),
                            Text(
                              controller.user == null
                                  ? '-'
                                  : (controller.user!.roles!.id == 3)
                                      ? "${controller.user!.divisi!.name!.toUpperCase()} - ${controller.user!.region!.name!.toUpperCase()} - ${controller.user!.cluster!.name!.toUpperCase()} - ${controller.user!.roles!.name!.toUpperCase()}"
                                      : (controller.user!.roles!.id == 2)
                                          ? "${controller.user!.divisi!.name!.toUpperCase()} - ${controller.user!.region!.name!.toUpperCase()} - ${controller.user!.roles!.name!.toUpperCase()}"
                                          : "${controller.user!.roles!.name!.toUpperCase()}",
                              style: greyFontStyle.copyWith(
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<HomePageController>(
                        id: 'logo',
                        builder: (_) => (controller.user == null)
                            ? SizedBox()
                            : Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage('assets/sam.png'),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),

                /// MENU
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              TrustLocation.isMockLocation.then((value) async {
                                if (await value) {
                                  Get.defaultDialog(
                                      title: 'PERINGATAN',
                                      titleStyle: blackFontStyle1,
                                      middleText:
                                          'Coba sekali lagi jika tetap muncul ada indikasi penggunaan fake GPS',
                                      middleTextStyle: blackFontStyle2,
                                      confirm: ElevatedButton(
                                        onPressed: () => Get.back(),
                                        child: Text("OK"),
                                      ));
                                } else {
                                  if (controller.user!.roles!.id == 1) {
                                    Get.bottomSheet(
                                      GetBuilder<HomePageController>(
                                        id: 'dropdown',
                                        builder: (_) => TmBottomSheet(
                                            isVisit: true,
                                            controller: controller),
                                      ),
                                    );
                                  } else {
                                    Get.to(() => CheckInOutScreen());
                                  }
                                }
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: "FF3F0A".toColor(),
                                image: DecorationImage(
                                    image: AssetImage('assets/live_visit.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 100,
                            child: Center(
                                child: Text(
                              "Live Visit",
                              style: blackFontStyle3,
                            )),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller.user!.roles!.id == 1) {
                                Get.bottomSheet(
                                  GetBuilder<HomePageController>(
                                    id: 'dropdown',
                                    builder: (_) => TmBottomSheet(
                                        isVisit: false, controller: controller),
                                  ),
                                );
                              } else {
                                Get.to(() => PlanVisitScreen());
                              }
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: "FF3F0A".toColor(),
                                image: DecorationImage(
                                    image: AssetImage('assets/plan_visit.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 100,
                            child: Center(
                                child: Text(
                              "Plan Visit",
                              style: blackFontStyle3,
                            )),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              bool isMockLocation =
                                  await TrustLocation.isMockLocation;
                              if (isMockLocation) {
                                Get.defaultDialog(
                                  title: 'PERINGATAN',
                                  titleStyle: blackFontStyle1,
                                  middleText:
                                      'Coba sekali lagi jika tetap muncul ada indikasi penggunaan fake GPS',
                                  middleTextStyle: blackFontStyle2,
                                  confirm: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.amber)),
                                    onPressed: () => Get.back(),
                                    child: Text(
                                      "OK",
                                      style: blackFontStyle3.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                );
                              } else {
                                Get.to(() => RegisterNoo());
                              }
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: "FF3F0A".toColor(),
                                image: DecorationImage(
                                    image: AssetImage('assets/noo.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 100,
                            child: Center(
                                child: Text(
                              "Register",
                              style: blackFontStyle3,
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomTabBar(
                        titles: ["PLAN VISIT"],
                        selectedIndex: 0,
                        onTap: (int index) {},
                      ),
                      GetBuilder<HomePageController>(
                        id: 'planvisit',
                        builder: (con) => RefreshIndicator(
                          onRefresh: () => con.getPlanVisit(),
                          child: ListPlanVisit(
                            data: con.listPlan,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
