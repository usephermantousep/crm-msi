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
                    nama: 'Nomor Pemilik Outlet*',
                  ),
                  FormRegisterNoo(
                    nama: "Isi Nomor Pemilik Outlet",
                    controller: controller.nomorPemilikOutlet,
                    validator: controller.validater,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                LabelFormRegisterHalf(
                                  nama: 'Foto Shop Sign',
                                  width: 130,
                                ),
                                GetBuilder<UpdateFotoOutletController>(
                                  id: 'fotoshopsign',
                                  builder: (_) {
                                    return (controller.shopSign == null)
                                        ? SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              controller
                                                  .deleteFoto('fotoshopsign');
                                            },
                                            iconSize: defaultMargin,
                                            color: Colors.red,
                                            icon: Icon(
                                              MdiIcons.closeBox,
                                            ),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<UpdateFotoOutletController>(
                        id: 'fotoshopsign',
                        builder: (_) {
                          return (controller.shopSign == null)
                              ? BoxFotoRegistration(
                                  function: () {
                                    controller.opsiMediaFoto('fotoshopsign');
                                  },
                                )
                              : BoxFotoRegistrationNoo(
                                  foto: controller.shopSign!,
                                );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                LabelFormRegisterHalf(
                                  nama: 'Foto Etalase',
                                  width: 130,
                                ),
                                GetBuilder<UpdateFotoOutletController>(
                                  id: 'fotoetalase',
                                  builder: (_) {
                                    return (controller.etalase == null)
                                        ? SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              controller
                                                  .deleteFoto('fotoetalase');
                                            },
                                            iconSize: defaultMargin,
                                            color: Colors.red,
                                            icon: Icon(MdiIcons.closeBox),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<UpdateFotoOutletController>(
                        id: 'fotoetalase',
                        builder: (_) {
                          return (controller.etalase == null)
                              ? BoxFotoRegistration(
                                  function: () {
                                    controller.opsiMediaFoto('fotoetalase');
                                  },
                                )
                              : BoxFotoRegistrationNoo(
                                  foto: controller.etalase!,
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                LabelFormRegisterHalf(
                                  nama: 'Foto Depan',
                                  width: 130,
                                ),
                                GetBuilder<UpdateFotoOutletController>(
                                  id: 'fotodepan',
                                  builder: (_) {
                                    return (controller.depan == null)
                                        ? SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              controller
                                                  .deleteFoto('fotodepan');
                                            },
                                            iconSize: defaultMargin,
                                            color: Colors.red,
                                            icon: Icon(
                                              MdiIcons.closeBox,
                                            ),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<UpdateFotoOutletController>(
                        id: 'fotodepan',
                        builder: (_) {
                          return (controller.depan == null)
                              ? BoxFotoRegistration(
                                  function: () {
                                    controller.opsiMediaFoto('fotodepan');
                                  },
                                )
                              : BoxFotoRegistrationNoo(
                                  foto: controller.depan!,
                                );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                LabelFormRegisterHalf(
                                  nama: 'Foto Belakang',
                                  width: 130,
                                ),
                                GetBuilder<UpdateFotoOutletController>(
                                  id: 'fotobelakang',
                                  builder: (_) {
                                    return (controller.belakang == null)
                                        ? SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              controller
                                                  .deleteFoto('fotobelakang');
                                            },
                                            iconSize: defaultMargin,
                                            color: Colors.red,
                                            icon: Icon(MdiIcons.closeBox),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<UpdateFotoOutletController>(
                        id: 'fotobelakang',
                        builder: (_) {
                          return (controller.belakang == null)
                              ? BoxFotoRegistration(
                                  function: () {
                                    controller.opsiMediaFoto('fotobelakang');
                                  },
                                )
                              : BoxFotoRegistrationNoo(
                                  foto: controller.belakang!,
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                LabelFormRegisterHalf(
                                  nama: 'Foto Kanan',
                                  width: 130,
                                ),
                                GetBuilder<UpdateFotoOutletController>(
                                  id: 'fotokanan',
                                  builder: (_) {
                                    return (controller.kanan == null)
                                        ? SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              controller
                                                  .deleteFoto('fotokanan');
                                            },
                                            iconSize: defaultMargin,
                                            color: Colors.red,
                                            icon: Icon(
                                              MdiIcons.closeBox,
                                            ),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<UpdateFotoOutletController>(
                        id: 'fotokanan',
                        builder: (_) {
                          return (controller.kanan == null)
                              ? BoxFotoRegistration(
                                  function: () {
                                    controller.opsiMediaFoto('fotokanan');
                                  },
                                )
                              : BoxFotoRegistrationNoo(
                                  foto: controller.kanan!,
                                );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                LabelFormRegisterHalf(
                                  nama: 'Foto Kiri',
                                  width: 130,
                                ),
                                GetBuilder<UpdateFotoOutletController>(
                                  id: 'fotokiri',
                                  builder: (_) {
                                    return (controller.kiri == null)
                                        ? SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              controller.deleteFoto('fotokiri');
                                            },
                                            iconSize: defaultMargin,
                                            color: Colors.red,
                                            icon: Icon(MdiIcons.closeBox),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<UpdateFotoOutletController>(
                        id: 'fotokiri',
                        builder: (_) {
                          return (controller.kiri == null)
                              ? BoxFotoRegistration(
                                  function: () {
                                    controller.opsiMediaFoto('fotokiri');
                                  },
                                )
                              : BoxFotoRegistrationNoo(
                                  foto: controller.kiri!,
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                LabelFormRegisterHalf(
                                  nama: 'Foto KTP/NPWP (jika ada)',
                                  width: 130,
                                ),
                                GetBuilder<UpdateFotoOutletController>(
                                  id: 'fotoktp',
                                  builder: (_) {
                                    return (controller.ktp == null)
                                        ? SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              controller.deleteFoto('fotoktp');
                                            },
                                            iconSize: defaultMargin,
                                            color: Colors.red,
                                            icon: Icon(MdiIcons.closeBox),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<UpdateFotoOutletController>(
                        id: 'fotoktp',
                        builder: (_) {
                          return (controller.ktp == null)
                              ? BoxFotoRegistration(
                                  function: () {
                                    controller.opsiMediaFoto('fotoktp');
                                  },
                                )
                              : BoxFotoRegistrationNoo(
                                  foto: controller.ktp!,
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Divider(),
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
                  "Submits",
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
