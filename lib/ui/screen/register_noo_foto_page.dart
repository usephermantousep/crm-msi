part of 'screen.dart';

class RegisterFotoNoo extends GetView<RegisterNooController> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Register NOO",
      subtitle: "Upload Foto",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: defaultMargin),
                                child: LabelFormRegisterHalf(
                                    nama: 'Foto Shop Sign'),
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
                                          icon: Icon(MdiIcons.closeBox),
                                        );
                                },
                              ),
                            ],
                          ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: defaultMargin),
                                child:
                                    LabelFormRegisterHalf(nama: 'Foto Etalase'),
                              ),
                              GetBuilder<RegisterNooController>(
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
                        GetBuilder<RegisterNooController>(
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: defaultMargin),
                                child:
                                    LabelFormRegisterHalf(nama: 'Foto Depan'),
                              ),
                              GetBuilder<RegisterNooController>(
                                id: 'fotodepan',
                                builder: (_) {
                                  return (controller.depan == null)
                                      ? SizedBox()
                                      : IconButton(
                                          onPressed: () {
                                            controller.deleteFoto('fotodepan');
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: defaultMargin),
                                child: LabelFormRegisterHalf(
                                    nama: 'Foto Belakang'),
                              ),
                              GetBuilder<RegisterNooController>(
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
                        GetBuilder<RegisterNooController>(
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: defaultMargin),
                                child:
                                    LabelFormRegisterHalf(nama: 'Foto Kanan'),
                              ),
                              GetBuilder<RegisterNooController>(
                                id: 'fotokanan',
                                builder: (_) {
                                  return (controller.kanan == null)
                                      ? SizedBox()
                                      : IconButton(
                                          onPressed: () {
                                            controller.deleteFoto('fotokanan');
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: defaultMargin),
                                child: LabelFormRegisterHalf(nama: 'Foto Kiri'),
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
                  ],
                ),
                SizedBox(
                  height: defaultMargin,
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
                  "Kembali",
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
