part of 'screen.dart';

class GmapsScreen extends GetView<CiCoController> {
  final String? title;
  final String? tipeVisit;
  const GmapsScreen({
    required this.title,
    required this.tipeVisit,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Live Visit",
      subtitle: title,
      backColor: Colors.black,
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 150,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: defaultMargin),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 250,
                    padding: EdgeInsets.only(left: 2),
                    child: (controller.initialCamera == null ||
                            controller.circles == null)
                        ? Container(
                            child: Center(
                            child: CircularProgressIndicator(),
                          ))
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: GoogleMap(
                                initialCameraPosition:
                                    controller.initialCamera!,
                                myLocationButtonEnabled: true,
                                onMapCreated: (con) =>
                                    controller.controller = con,
                                zoomControlsEnabled: false,
                                zoomGesturesEnabled: false,
                                markers: {controller.lokasi!},
                                circles: controller.circles!),
                          ),
                  ),
                  GetBuilder<CiCoController>(
                    id: 'foto',
                    builder: (_) => Container(
                      padding: EdgeInsets.only(right: 2),
                      height: 250,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: (controller.foto == null)
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Obx(
                                  () => (controller.isProcess.value)
                                      ? CircularProgressIndicator()
                                      : ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      "FF3F0A".toColor()),
                                              elevation:
                                                  MaterialStateProperty.all(0)),
                                          onPressed: () {
                                            controller.getImage();
                                          },
                                          child: Text("Photo"),
                                        ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: double.infinity,
                              child: Image.file(
                                controller.foto!,
                                fit: BoxFit.fill,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: (title == "Check In")
                  ? Container()
                  : RoundedInputField(
                      controller: controller.laporanVisit,
                      hintText: "Laporan hasil kunjungan",
                      icon: Icons.note_rounded),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  child: (title == "Check In")
                      ? Text("*Pastikan untuk upload foto sebelum $title")
                      : Text(
                          "*Pastikan untuk upload foto dan input laporan sebelum $title",
                          style: blackFontStyle3.copyWith(fontSize: 10),
                        ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all("FF3F0A".toColor()),
                      elevation: MaterialStateProperty.all(0)),
                  onPressed: () {
                    if (controller.foto == null) {
                      controller.notif("Salah", "Anda belum foto");
                    } else {
                      controller
                          .submit(
                              (title == "Check In") ? true : false,
                              tipeVisit!,
                              (title == "Check In")
                                  ? ''
                                  : controller.laporanVisit.text)
                          .then((value) {
                        if (value) {
                          Get.defaultDialog(
                            title: 'Success',
                            titleStyle: blackFontStyle1,
                            middleText: '$title Berhasil',
                            middleTextStyle: blackFontStyle2,
                            confirm: ElevatedButton(
                              onPressed: () {
                                Get.offAll(() => MainPage());
                              },
                              child: Text(
                                "OK",
                                style: blackFontStyle1.copyWith(
                                    color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  "FF3F0A".toColor(),
                                ),
                              ),
                            ),
                          );
                        }
                      });
                    }
                  },
                  child: Text(
                    title!,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
