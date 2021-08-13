part of 'screen.dart';

class CheckInOutScreen extends StatefulWidget {
  @override
  _CheckInOutScreenState createState() => _CheckInOutScreenState();
}

class _CheckInOutScreenState extends State<CheckInOutScreen> {
  String? selectedOutlet;
  double? latOutlet, longOutlet;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      backColor: Colors.black,
      title: "Visit",
      subtitle: 'Live Visit',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin),
              width: double.infinity,
              height: 250,
              color: Colors.white,
              child: Column(
                children: [
                  ClockWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<OutletCubitCubit, OutletCubitState>(
                    builder: (_, state) {
                      if (state is OutletLoaded) {
                        List<OutletModel> o = state.outlets;
                        return Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black),
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: defaultMargin,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  items: o
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          child: Text(
                                            e.namaOutlet!,
                                            style: blackFontStyle3.copyWith(
                                                fontSize: 14),
                                          ),
                                          value: e.latLong!,
                                        ),
                                      )
                                      .toList(),
                                  value: selectedOutlet,
                                  hint: Text("Pilih Outlet"),
                                  onChanged: (value) {
                                    List latLong = value.toString().split(",");
                                    for (int i = 0; i < latLong.length; i++) {
                                      if (i == 0) {
                                        latOutlet = double.parse(latLong[i]);
                                      } else {
                                        longOutlet = double.parse(latLong[i]);
                                      }
                                    }
                                    setState(() {
                                      selectedOutlet = value!.toString();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green[400]),
                                      ),
                                      onPressed: () {
                                        if (selectedOutlet == null) {
                                          {
                                            Get.snackbar("", "",
                                                padding: EdgeInsets.all(10),
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                backgroundColor:
                                                    Colors.red[300],
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                titleText: Text(
                                                  "SALAH !!!",
                                                  style: blackFontStyle1,
                                                ),
                                                messageText: Text(
                                                  "Pilih outlet terlebih dahulu",
                                                  style: blackFontStyle2,
                                                ));
                                          }
                                        } else {
                                          Get.to(() => GmapsScreen(
                                                outlet: o,
                                                latOutlet: latOutlet,
                                                longOutlet: longOutlet,
                                                title: "Check In",
                                                latLong: selectedOutlet,
                                              ));
                                        }
                                      },
                                      child: Text(
                                        "Check In",
                                        style: blackFontStyle3.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            letterSpacing: 1.5),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red[400]),
                                      ),
                                      onPressed: () {
                                        if (selectedOutlet == null) {
                                          {
                                            Get.snackbar("", "",
                                                padding: EdgeInsets.all(10),
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                backgroundColor:
                                                    Colors.red[300],
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                titleText: Text(
                                                  "SALAH !!!",
                                                  style: blackFontStyle1,
                                                ),
                                                messageText: Text(
                                                  "Pilih outlet terlebih dahulu",
                                                  style: blackFontStyle2,
                                                ));
                                          }
                                        } else {
                                          Get.to(() => GmapsScreen(
                                                outlet: o,
                                                latOutlet: latOutlet,
                                                longOutlet: longOutlet,
                                                title: "Check Out",
                                                latLong: selectedOutlet,
                                              ));
                                        }
                                      },
                                      child: Text(
                                        "Check Out",
                                        style: blackFontStyle3.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            letterSpacing: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      } else {
                        print(state);
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: defaultMargin,
              width: double.infinity,
              color: "FAFAFC".toColor(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              color: Colors.white,
              child: Text(
                "Log Visit",
                style: blackFontStyle1,
              ),
            ),
            BlocBuilder<VisitCubit, VisitState>(builder: (_, state) {
              if (state is VisitLoaded) {
                List<VisitModel> data = state.visit;
                return ListLogVisit(
                  data: data,
                );
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
