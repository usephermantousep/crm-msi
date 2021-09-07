part of 'screen.dart';

class RegisterNoo extends StatelessWidget {
  final controller = Get.put(RegisterNooController());

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Register NOO",
      subtitle: "Detail Outlet",
      backColor: Colors.black,
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            LabelFormRegister(
              nama: "Nama Outlet",
            ),
            FormRegisterFull(
              controller: controller.namaOutlet!,
              nama: 'Isi Nama Outlet',
            ),
            LabelFormRegister(
              nama: 'Nama Pemilik Outlet',
            ),
            FormRegisterFull(
              nama: "Isi Nama Pemilik Outlet",
              controller: controller.namaPemilikOutlet!,
            ),
            LabelFormRegister(nama: 'KTP/NPWP Outlet'),
            FormRegisterFull(
              nama: "KTP/NPWP Outlet",
              controller: controller.ktpOutlet!,
            ),
            LabelFormRegister(nama: 'Alamat Outlet'),
            FormRegisterFull(
                nama: "Isi Alamat Outlet",
                controller: controller.alamatOutlet!),
            LabelFormRegister(
              nama: 'Nomor Pemilik Outlet',
            ),
            FormRegisterFull(
              nama: "Isi Nomor Pemilik Outlet",
              controller: controller.nomorPemilikOutlet!,
            ),
            LabelFormRegister(
              nama: 'Nomor Perwakilan Outlet / FL',
            ),
            FormRegisterFull(
              nama: "Isi Nomor Perwakilan Outlet / FL",
              controller: controller.nomerWakilOutlet!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(
                      nama: 'Cluster',
                    ),
                    GetBuilder<RegisterNooController>(
                      builder: (_) {
                        return DropDownHalf(
                            dropdownValue: controller.selectedCluster,
                            opsi: controller.opsiCluster,
                            function: (String? val) {
                              if (val != null) {
                                controller.onChangeCluster(val);
                              }
                            },
                            width: 0.36);
                      },
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Kota"),
                    FormRegisterHalf(
                        controller: controller.kotaOutlet!, nama: "Isi Kota"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              padding: EdgeInsets.only(left: defaultMargin),
              child: Row(
                children: [
                  Text("Promotor & FL", style: blackFontStyle2),
                ],
              ),
            ),
            GetBuilder<RegisterNooController>(
              builder: (_) {
                return OpsiDigitWidget(
                  controller: controller,
                  title1: 'OPPO',
                  text1: 'oppo',
                  dropdownValue1: controller.oppo,
                  title2: 'VIVO',
                  text2: 'vivo',
                  dropdownValue2: controller.vivo,
                );
              },
            ),
            GetBuilder<RegisterNooController>(
              builder: (_) {
                return OpsiDigitWidget(
                  controller: controller,
                  title1: 'REALME',
                  text1: 'realme',
                  dropdownValue1: controller.realme,
                  title2: 'SAMSUNG',
                  text2: 'infinix',
                  dropdownValue2: controller.samsung,
                );
              },
            ),
            GetBuilder<RegisterNooController>(
              builder: (_) {
                return OpsiDigitWidget(
                  controller: controller,
                  title1: 'XIAOMI',
                  text1: 'xiaomi',
                  dropdownValue1: controller.xiaomi,
                  title2: 'FL',
                  text2: 'fl',
                  dropdownValue2: controller.fl,
                );
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(defaultMargin, 10, 0, defaultMargin),
              child: Row(
                children: [
                  Text("Foto & Video", style: blackFontStyle2),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => RegisterFotoNoo());
                    },
                    child: Text("Upload Foto",
                        style: blackFontStyle3.copyWith(color: Colors.white)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          "FF3F0A".toColor(),
                        ),
                        elevation: MaterialStateProperty.all(0)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ImagePicker picker = ImagePicker();
                      Get.defaultDialog(
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      "FF3F0A".toColor()),
                                  elevation: MaterialStateProperty.all(0)),
                              onPressed: () {},
                              child: Text("Kamera",
                                  style: blackFontStyle3.copyWith(
                                      color: Colors.white)),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      "FF3F0A".toColor()),
                                  elevation: MaterialStateProperty.all(0)),
                              onPressed: () {},
                              child: Text("Galeri",
                                  style: blackFontStyle3.copyWith(
                                      color: Colors.white)),
                            )
                          ],
                          title: 'Upload Video',
                          middleText: 'Pilih Media :',
                          titleStyle: blackFontStyle3.copyWith(fontSize: 14),
                          middleTextStyle: blackFontStyle2);
                    },
                    child: Text("Upload Video",
                        style: blackFontStyle3.copyWith(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        "FF3F0A".toColor(),
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  defaultMargin, 10, defaultMargin, defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lokasi Outlet", style: blackFontStyle2),
                  IconButton(
                    onPressed: () => controller.getCurrentPosition(),
                    icon: Icon(MdiIcons.refreshCircle),
                  )
                ],
              ),
            ),
            GetBuilder<RegisterNooController>(
              builder: (_) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: (controller.lat == null && controller.long == null)
                      ? Container(
                          child: Center(
                          child: CircularProgressIndicator(),
                        ))
                      : GoogleMap(
                          initialCameraPosition: controller.initialCamera!,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          markers: {controller.lokasi!},
                        ),
                );
              },
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  controller.submit();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                child: Text(
                  "Submit",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: defaultMargin,
            )
          ],
        ),
      ),
    );
  }
}
