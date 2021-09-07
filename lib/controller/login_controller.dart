part of 'controllers.dart';

class LoginController extends GetxController {
  TextEditingController? userName;
  UserModel? user;
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
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(10),
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

  Future<bool> signIn(String userName, String pass) async {
    if (userName.isEmpty ||
        pass.isEmpty ||
        userName.isBlank! ||
        pass.isBlank!) {
      showError('Salah !', 'Username / Password harus di isi dan lengkap');
      return false;
    } else {
      ApiReturnValue<UserModel> result =
          await UserServices.signIn(userName, pass);

      if (result.value != null) {
        user = result.value;
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setInt('userId', result.value!.id!);
        return true;
      } else {
        showError("ERROR", result.message!);
        return false;
      }
    }
  }
}
