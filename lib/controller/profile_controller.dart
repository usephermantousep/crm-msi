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

  @override
  void onInit() {
    getDetailUser();
    getDataOutlet();
    getVisited();
    super.onInit();
  }
}
