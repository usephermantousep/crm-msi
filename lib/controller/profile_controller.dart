part of 'controllers.dart';

class ProfileController extends GetxController {
  int selectedIndex = 0;
  UserModel? user;
  List<OutletModel>? outlets;

  Future<void> getDetailUser() async {
    ApiReturnValue<UserModel> result = await UserServices.getSingleUser();
    if (result.value != null) {
      user = result.value;
      update();
    }
  }

  Future<void> getDataOutlet() async {
    ApiReturnValue<List<OutletModel>> result = await OutletServices.getOutlet();

    if (result.value != null) {
      outlets = result.value!;
      update();
    }

    update();
  }

  void changePage(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    getDetailUser();
    getDataOutlet();
    super.onInit();
  }
}
