part of 'controllers.dart';

class LoginController extends GetxController {
  TextEditingController? userName;

  TextEditingController? pass;

  var isLoading = false.obs;

  @override
  void onInit() {
    userName = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  void showError(String judul, String msg) {
    Get.snackbar('title', 'message',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 10),
        titleText:
            Text(judul, style: blackFontStyle1.copyWith(color: Colors.white)),
        messageText:
            Text(msg, style: blackFontStyle2.copyWith(color: Colors.white)),
        backgroundColor: "FF3F0A".toColor());
  }

  @override
  void onClose() {
    userName!.dispose();
    pass!.dispose();
    super.onClose();
  }

  Future<UserModel> signIn(String userName, String pass) async {
    if (userName == "usep" && pass == '123') {
      ApiReturnValue<UserModel> result =
          await UserServices.signIn(userName, pass);

      if (result.value != null) {
        return result.value!;
      }
      return UserModel();
    } else {
      showError('Salah !', 'Username / Password Salah');
      return UserModel();
    }
  }
}
