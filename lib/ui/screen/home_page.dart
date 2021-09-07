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
                                  'https://media-exp1.licdn.com/dms/image/C510BAQE_qu9Y_R0E_w/company-logo_200_200/0/1524477655696?e=2159024400&v=beta&t=bax_2jR9zR5IHlQdnTzDbTsn1maZsXOjEm3BJunbZMM'),
                              fit: BoxFit.cover),
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
                            onTap: () {
                              Get.to(() => CheckInOutScreen());
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
                            onTap: () async {
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
                            onTap: () {
                              Get.to(() => RegisterNoo());
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
