part of 'controllers.dart';

class LoginController extends GetxController {
  TextEditingController? userName, pass;
  UserModel? user;
  bool islogin = false;
  bool loadingLogin = true;
  Rx<bool> loading = false.obs;
  Rx<bool> obsecure = true.obs;

  @override
  void onInit() async {
    userName = TextEditingController();
    pass = TextEditingController();
    PermissionStatus status = await Permission.location.request();
    print(status);
    await Permission.camera.request().then((value) => print(value));
    await Permission.storage.request().then((value) => print(value));
    await check().then((value) async {
      if (value) {
        loadingLogin = false;
        islogin = true;
        update(['login']);
      } else {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.clear();
        loadingLogin = false;
        update(['login']);
      }
    });
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

  void open() {
    obsecure.toggle();
    update();
  }

  Future<bool> check() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    if (token == null) {
      return false;
    } else {
      ApiReturnValue<bool> login = await UserServices.check(token);
      if (login.value!) {
        return true;
      } else {
        return false;
      }
    }
  }
}
