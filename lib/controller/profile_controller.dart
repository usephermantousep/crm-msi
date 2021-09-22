part of 'controllers.dart';

class ProfileController extends GetxController {
  int selectedIndex = 0;
  UserModel? user;
  List<VisitModel>? visit;
  List<OutletModel>? outlets;

  Future<void> getDetailUser() async {
    ApiReturnValue<UserModel> result = await UserServices.getSingleUser();
    if (result.value != null) {
      user = result.value;
      update(['outlet']);
    }
  }

  Future<void> getDataOutlet() async {
    ApiReturnValue<List<OutletModel>> result = await OutletServices.getOutlet();

    if (result.value != null) {
      outlets = result.value!;
      update(['outlet']);
    }
  }

  Future<void> getVisited() async {
    ApiReturnValue<List<VisitModel>> result = await VisitServices.getVisit();

    if (result.value != null) {
      visit = result.value!;
      update(['outlet']);
    }
  }

  void changePage(int index) {
    selectedIndex = index;
    update(['tab', 'outlet']);
  }

  Future<bool> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiReturnValue<bool> result = await UserServices.logout();

    if (result.value != null) {
      if (result.value!) {
        pref.remove('role');
        pref.remove('token');
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
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
  void onInit() {
    getDetailUser();
    getDataOutlet();
    getVisited();
    super.onInit();
  }
}
