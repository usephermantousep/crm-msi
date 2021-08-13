part of 'screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String getIntMonth(DateTime? now) {
    return new DateFormat("M").format(now!);
  }

  int selectedIndex = 0;
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
                            style: (MediaQuery.of(context).size.width < 1080)
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
                                  'https://i.im.ge/2021/07/28/IDr9C.jpg'),
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                ),

                /// MENU
                Container(
                  height: 250,
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
                                color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage('assets/bike.png'),
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
                              context.read<PlanVisitCubit>().getPlanByMonth(
                                  1, getIntMonth(DateTime.now()).toInt());
                              Get.to(() => PlanVisitScreen());
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage('assets/bike.png'),
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
                                color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage('assets/bike.png'),
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
                        selectedIndex: selectedIndex,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      BlocBuilder<PlanVisitCubit, PlanVisitState>(
                        builder: (_, state) {
                          if (state is PlanVisitLoaded) {
                            return ListPlanVisit(
                              data: state.data,
                            );
                          } else {
                            return Container(
                              child: Center(
                                child: loadingIndicator,
                              ),
                            );
                          }
                        },
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
