part of 'screen.dart';

class RegisterFotoNoo extends GetView<RegisterNooController> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Register",
      subtitle: "Upload Foto",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        child: Column(
          children: [
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
                                GetBuilder<RegisterNooController>(
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
                      GetBuilder<RegisterNooController>(
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
                                  nama: 'Foto Depan',
                                  width: 130,
                                ),
                                GetBuilder<RegisterNooController>(
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
                      GetBuilder<RegisterNooController>(
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
                                GetBuilder<RegisterNooController>(
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
                      GetBuilder<RegisterNooController>(
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
                                GetBuilder<RegisterNooController>(
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
                      GetBuilder<RegisterNooController>(
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
                GetBuilder<RegisterNooController>(
                  id: 'fotoktp',
                  builder: (_) => (controller.selectedJenis == "NOO")
                      ? Container(
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
                                          nama: 'Foto KTP/NPWP',
                                          width: 130,
                                        ),
                                        (controller.ktp == null)
                                            ? SizedBox()
                                            : IconButton(
                                                onPressed: () {
                                                  controller
                                                      .deleteFoto('fotoktp');
                                                },
                                                iconSize: defaultMargin,
                                                color: Colors.red,
                                                icon: Icon(MdiIcons.closeBox),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              (controller.ktp == null)
                                  ? BoxFotoRegistration(
                                      function: () {
                                        controller.opsiMediaFoto('fotoktp');
                                      },
                                    )
                                  : BoxFotoRegistrationNoo(
                                      foto: controller.ktp!,
                                    ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                child: Text(
                  "Simpan",
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
