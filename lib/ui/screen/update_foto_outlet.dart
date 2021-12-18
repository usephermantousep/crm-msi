part of 'screen.dart';

class UpdateFotoOutlet extends StatelessWidget {
  final controller = Get.put(UpdateFotoOutletController());
  final String? namaOutlet;

  UpdateFotoOutlet({required this.namaOutlet});
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Update Outlet",
      subtitle: "Upload Foto",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        child: Column(
          children: [
            Form(
              key: controller.submitFormKey,
              child: Column(
                children: [
                  LabelFormRegister(
                    nama: 'Nama Pemilik Outlet*',
                  ),
                  FormRegisterNoo(
                    nama: "Isi Nama Pemilik Outlet",
                    controller: controller.namaPemilikOutlet,
                    validator: controller.validater,
                  ),
                  LabelFormRegister(
                    nama: 'Nomor Telepon Pemilik Outlet*',
                  ),
                  FormRegisterNoo(
                    nama: "Isi Nomor Telepon Pemilik Outlet",
                    controller: controller.nomorPemilikOutlet,
                    validator: controller.validater,
                    type: TextInputType.number,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Divider(),
            SizedBox(
              height: defaultMargin,
            ),
            GetBuilder<UpdateFotoOutletController>(
              id: 'butvid',
              builder: (_) => ElevatedButton(
                onPressed: () {
                  controller.getVideo(context);
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
            ),
            GetBuilder<UpdateFotoOutletController>(
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
                                      .videoPlayerController!.value.aspectRatio,
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
              child: Text(
                "#Pastikan rekam shopsign outlet dan outletnya secara menyeluruh!!!",
                style: blackFontStyle3.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    decoration:
                        TextDecoration.combine([TextDecoration.underline])),
                textAlign: TextAlign.center,
              ),
            ),
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
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.submitFormKey.currentState!.validate()) {
                    await controller
                        .submit(
                          namaOutlet!,
                          controller.namaPemilikOutlet.text,
                          controller.nomorPemilikOutlet.text,
                        )
                        .then(
                          (value) => value
                              ? controller.dialog(
                                  'Berhasil update',
                                  'Anda sudah bisa Check In\nOutlet ini',
                                )
                              : print('error'),
                        );
                  } else {
                    controller.notif(
                        'Salah', "Isi nama pemilik dan nomer telepon");
                  }
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
