part of 'screen.dart';

class CheckInOutScreen extends StatelessWidget {
  final CiCoController _controller = Get.find<CiCoController>();
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
                  Container(
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
                          child: GetBuilder<CiCoController>(
                            builder: (controller) => DropdownButton(
                              underline: SizedBox(),
                              isExpanded: true,
                              items: controller.outlets
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
                              value: controller.selectedOutlet,
                              hint: Text("Pilih Outlet"),
                              onChanged: (String? value) {
                                controller.newSelected(value!);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.green[400]),
                                ),
                                onPressed: () {
                                  if (_controller.selectedOutlet == null) {
                                    {
                                      Get.snackbar("", "",
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(bottom: 10),
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          backgroundColor: Colors.red[300],
                                          snackPosition: SnackPosition.BOTTOM,
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
                                          outlet: _controller.outlets,
                                          latOutlet: _controller.latOutlet,
                                          longOutlet: _controller.longOutlet,
                                          title: "Check In",
                                          latLong: _controller.selectedOutlet,
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
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.red[400]),
                                ),
                                onPressed: () {
                                  if (_controller.selectedOutlet == null) {
                                    {
                                      Get.snackbar("", "",
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(bottom: 10),
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          backgroundColor: Colors.red[300],
                                          snackPosition: SnackPosition.BOTTOM,
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
                                          outlet: _controller.outlets,
                                          latOutlet: _controller.latOutlet,
                                          longOutlet: _controller.longOutlet,
                                          title: "Check Out",
                                          latLong: _controller.selectedOutlet,
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
                  )
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
            ListLogVisit(
              data: [],
            ),
          ],
        ),
      ),
    );
  }
}
