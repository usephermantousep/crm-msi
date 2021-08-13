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

  @override
  void onClose() {
    userName!.dispose();
    pass!.dispose();
    super.onClose();
  }

  static String getIntMonth(DateTime now) {
    return new DateFormat("M").format(now);
  }
}
