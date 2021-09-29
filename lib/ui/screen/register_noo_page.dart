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
        child: Form(
          key: controller.submitFormKey,
          child: Column(
            children: [
              LabelFormRegister(
                nama: "Nama Outlet*",
              ),
              FormRegisterNoo(
                controller: controller.namaOutlet!,
                nama: 'Isi Nama Outlet',
                validator: controller.validater,
              ),
              LabelFormRegister(
                nama: 'Nama Pemilik Outlet*',
              ),
              FormRegisterNoo(
                nama: "Isi Nama Pemilik Outlet",
                controller: controller.namaPemilikOutlet!,
                validator: controller.validater,
              ),
              LabelFormRegister(nama: 'KTP/NPWP Outlet*'),
              FormRegisterNoo(
                nama: "KTP/NPWP Outlet",
                controller: controller.ktpOutlet!,
                validator: controller.validater,
              ),
              LabelFormRegister(nama: 'Alamat Outlet*'),
              FormRegisterNoo(
                nama: "Isi Alamat Outlet",
                controller: controller.alamatOutlet!,
                validator: controller.validater,
              ),
              LabelFormRegister(
                nama: 'Nomor Pemilik Outlet*',
              ),
              FormRegisterNoo(
                nama: "Isi Nomor Pemilik Outlet",
                controller: controller.nomorPemilikOutlet!,
                validator: controller.validater,
              ),
              LabelFormRegister(
                nama: 'Nomor Perwakilan Outlet / FL*',
              ),
              FormRegisterNoo(
                nama: "Isi Nomor Perwakilan Outlet / FL",
                controller: controller.nomerWakilOutlet!,
                validator: controller.validater,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelFormRegisterHalf(
                        nama: 'Cluster*',
                      ),
                      GetBuilder<RegisterNooController>(
                        id: 'cluster',
                        builder: (_) {
                          return DropDownHalf(
                              validator: controller.validater,
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
                      LabelFormRegisterHalf(nama: "Kota*"),
                      FormRegisterHalf(
                          validator: controller.validater,
                          controller: controller.kotaOutlet!,
                          nama: "Isi Kota"),
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
                id: 'dropdowndigit',
                builder: (_) {
                  return OpsiDigitWidget(
                    validator: controller.validater,
                    controller: controller,
                    title1: 'OPPO*',
                    text1: 'oppo',
                    dropdownValue1: controller.oppo,
                    title2: 'VIVO*',
                    text2: 'vivo',
                    dropdownValue2: controller.vivo,
                    title3: 'XIAOMI*',
                    text3: 'xiaomi',
                    dropdownValue3: controller.xiaomi,
                  );
                },
              ),
              GetBuilder<RegisterNooController>(
                id: 'dropdowndigit',
                builder: (_) {
                  return OpsiDigitWidget(
                    validator: controller.validater,
                    controller: controller,
                    title1: 'REALME*',
                    text1: 'realme',
                    dropdownValue1: controller.realme,
                    title2: 'SAMSUNG*',
                    text2: 'infinix',
                    dropdownValue2: controller.samsung,
                    title3: 'FL*',
                    text3: 'fl',
                    dropdownValue3: controller.fl,
                  );
                },
              ),
              Container(
                padding:
                    EdgeInsets.fromLTRB(defaultMargin, 10, 0, defaultMargin),
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
                    GetBuilder<RegisterNooController>(
                      id: 'butfoto',
                      builder: (_) => ElevatedButton(
                        onPressed: () {
                          Get.to(() => RegisterFotoNoo());
                        },
                        child: Text("Upload Foto",
                            style:
                                blackFontStyle3.copyWith(color: Colors.white)),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              (controller.shopSign == null ||
                                      controller.depan == null ||
                                      controller.belakang == null ||
                                      controller.kanan == null ||
                                      controller.kiri == null ||
                                      controller.etalase == null)
                                  ? "FF3F0A".toColor()
                                  : Colors.green[400],
                            ),
                            elevation: MaterialStateProperty.all(0)),
                      ),
                    ),
                    GetBuilder<RegisterNooController>(
                      id: 'butvid',
                      builder: (_) => ElevatedButton(
                        onPressed: () {
                          controller.opsiMediaVideo();
                        },
                        child: Text(
                          "Upload Video",
                          style: blackFontStyle3.copyWith(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            (controller.video == null)
                                ? "FF3F0A".toColor()
                                : Colors.green[400],
                          ),
                          elevation: MaterialStateProperty.all(0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GetBuilder<RegisterNooController>(
                  id: 'video',
                  builder: (_) {
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: defaultMargin),
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: (controller.video != null)
                            ? controller
                                    .videoPlayerController!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: controller
                                        .videoPlayerController!
                                        .value
                                        .aspectRatio,
                                    child: VideoPlayer(
                                        controller.videoPlayerController!),
                                  )
                                : Container()
                            : Container(
                                child: Center(
                                child: Text(
                                  "Preview Video",
                                  style: blackFontStyle1,
                                ),
                              )));
                  }),
              Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (controller.video != null) {
                            controller.play();
                          }
                        },
                        icon: Icon(MdiIcons.play),
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          if (controller.video != null) {
                            controller.pause();
                          }
                        },
                        icon: Icon(MdiIcons.pause),
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          if (controller.video != null) {
                            controller.deleteVideo();
                          }
                        },
                        icon: Icon(MdiIcons.delete),
                        iconSize: 30,
                      ),
                    ],
                  )),
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
                id: 'gmaps',
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
      ),
    );
  }
}
