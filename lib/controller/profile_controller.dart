part of 'controllers.dart';

class ProfileController extends GetxController {
  int selectedIndex = 0;
  UserModel? user;

  Future<void> getDetailUser() async {
    ApiReturnValue<UserModel> result =
        await UserServices.signIn("userName", "password");

    if (result.value != null) {
      user = result.value;
    }
  }

  void changePage(int index) {
    selectedIndex = index;
    print(selectedIndex);
    update();
  }

  @override
  void onInit() {
    getDetailUser();
    super.onInit();
  }
}
