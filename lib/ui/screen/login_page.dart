part of 'screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => GeneralPage(
              subtitle: "Fast Friendly Focus",
              title: "LOGIN",
              child: Container(
                child: Column(
                  children: [
                    LabelFormRegister(nama: "User Name"),
                    FormRegisterFull(
                        nama: "Masukkan User Name",
                        controller: controller.userName!),
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
                            controller.isLoading.toggle();
                            Get.to(() => MainPage());
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                          )),
                    )
                  ],
                ),
              ),
            ));
  }
}
