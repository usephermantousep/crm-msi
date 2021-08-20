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
                        LabelFormRegisterHalf(nama: 'Foto Shop Sign'),
                        (controller.shopSign == null)
                            ? BoxFotoRegistration(
                                function: () {},
                              )
                            : Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width * 0.37,
                                margin: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black),
                                  // image: DecorationImage(
                                  //     image: FileImage(_shopSign!),
                                  //     fit: BoxFit.fill),
                                ),
                              )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelFormRegisterHalf(nama: 'Foto Etalase'),
                        BoxFotoRegistration(
                          function: () async {},
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
                        LabelFormRegisterHalf(nama: 'Foto Depan'),
                        BoxFotoRegistration(
                          function: () {},
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelFormRegisterHalf(nama: 'Foto Belakang'),
                        BoxFotoRegistration(
                          function: () {},
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
                        LabelFormRegisterHalf(nama: 'Foto Kanan'),
                        BoxFotoRegistration(
                          function: () {},
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelFormRegisterHalf(nama: 'Foto Kiri'),
                        BoxFotoRegistration(
                          function: () {},
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
