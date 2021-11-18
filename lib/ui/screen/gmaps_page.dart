part of 'screen.dart';

class GmapsScreen extends GetView<CiCoController> {
  final String? title;
  final String? tipeVisit;
  final String? kodeCsa;
  const GmapsScreen({
    required this.title,
    required this.tipeVisit,
    this.kodeCsa,
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
        height: (title == 'Check In')
            ? MediaQuery.of(context).size.height - 150
            : MediaQuery.of(context).size.height,
        color: Colors.white,
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
            (title == 'Check Out')
                ? Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LabelFormRegisterHalf(
                            nama: "Outlet Transaksi ?",
                            width: 150,
                          ),
                          GetBuilder<CiCoController>(
                            id: 'transaksi',
                            builder: (_) => Container(
                              child: DropDownHalf(
                                  dropdownValue: controller.transaksi,
                                  opsi: controller.yesNo,
                                  function: (String? value) {
                                    if (value != null) {
                                      controller.changeTrans(value);
                                    }
                                  },
                                  width: 0.35,
                                  validator: controller.validater),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
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
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all("FF3F0A".toColor()),
                      elevation: MaterialStateProperty.all(0)),
                  onPressed: () {
                    if (controller.foto == null) {
                      controller.notif("Salah", "Anda belum foto");
                    } else {
                      (title == 'Check In')
                          ? controller.submit(true, tipeVisit!).then((value) {
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
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        "FF3F0A".toColor(),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            })
                          : controller
                              .submit(
                              false,
                              tipeVisit!,
                              laporan: controller.laporanVisit.text,
                              transaksi: controller.transaksi,
                            )
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
                                      backgroundColor:
                                          MaterialStateProperty.all(
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
