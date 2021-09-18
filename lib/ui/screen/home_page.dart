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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MEDIA SELULAR INDONESIA",
                            softWrap: false,
                            style: (MediaQuery.of(context).size.width < 1000)
                                ? blackFontStyle2
                                : blackFontStyle1,
                          ),
                          Text(
                            "Grosir App",
                            style: greyFontStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://msis.co.id/wp-content/uploads/2021/08/Logo-MSI-Media-Selular-Indonesia-1024x570.png'),
                              fit: BoxFit.fitWidth),
                        ),
                      )
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
                              bool isMockLocation =
                                  await TrustLocation.isMockLocation;
                              if (isMockLocation) {
                                Get.defaultDialog(
                                    title: 'PERINGATAN',
                                    titleStyle: blackFontStyle1,
                                    middleText:
                                        'Anda menggunakan aplikasi fake GPS harap hapus terlebih dahulu',
                                    middleTextStyle: blackFontStyle2,
                                    confirm: ElevatedButton(
                                      onPressed: () => Get.back(),
                                      child: Text("OK"),
                                    ));
                              } else {
                                Get.to(() => CheckInOutScreen());
                              }
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
                              Get.to(() => PlanVisitScreen());
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
                                      'Anda menggunakan aplikasi\n FAKE GPS \nharap hapus terlebih dahulu',
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
                              "Register NOO",
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
                        titles: ["Plan Visit"],
                        selectedIndex: 0,
                        onTap: (index) {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GetBuilder<HomePageController>(
                        id: 'planvisit',
                        builder: (con) => ListPlanVisit(
                          data: con.listPlan,
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
