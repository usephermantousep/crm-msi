part of 'controllers.dart';

class LoginController extends GetxController {
  TextEditingController? userName;
  UserModel? user;
  TextEditingController? pass;
  var islogin = false.obs;
  var loadingLogin = false.obs;

  var isLoading = false.obs;

  @override
  void onInit() async {
    userName = TextEditingController();
    pass = TextEditingController();
    await LocationPermissions().requestPermissions();
    await Permission.camera;
    await Permission.storage;
    check();
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
        return true;
      } else {
        showError("ERROR", result.message!);
        return false;
      }
    }
  }

  void check() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    if(token == null) {
      loadingLogin.toggle();
    }else{
    await UserServices.check(token).then((value) {
        if (value.value != null){
          if (value.value!){
            loadingLogin.toggle();
            islogin.toggle();
          return ApiReturnValue(value: value.value);
          }
        }else{
          return ApiReturnValue(value: value.value);

        }
    });
     
    }
   
    }
}
