part of 'screen.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      subtitle: "Fast Friendly Focus",
      title: "LOGIN",
      child: Container(
        child: Column(
          children: [
            LabelFormRegister(nama: "User Name"),
            FormRegisterFull(
                nama: "Masukkan User Name", controller: controller.userName!),
            LabelFormRegister(nama: "Password"),
            FormRegisterFull(
              nama: "Masukkan Password",
              controller: controller.pass!,
              obsecure: true,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.userName!.text.isEmpty |
                          controller.pass!.text.isEmpty ||
                      controller.userName!.text == '' ||
                      controller.pass!.text == '') {
                    controller.showError('Salah !',
                        'isi username dan password dengan benar dan lengkap');
                  } else {
                    controller.isLoading.toggle();
                    controller
                        .signIn(
                            controller.userName!.text, controller.pass!.text)
                        .then((value) async {
                      if (value) {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString('role', controller.user!.roles!);
                        Get.offAll(() => MainPage());
                      } else {
                        controller.isLoading.toggle();
                      }
                    });
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                child: Obx(
                  () => (controller.isLoading.value)
                      ? loadingIndicator
                      : Text(
                          "LOGIN",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
