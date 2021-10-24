part of 'controllers.dart';

class HomePageController extends GetxController {
  int selectedIndex = 0;
  List<PlanVisitModel> listPlan = [];
  String? month;
  int? bulan;
  UserModel? user;
  List<DivisiModel>? divisi;
  List<RegionModel>? region;
  String? selectedDivisi;
  String? selectedRegion;

  Future<void> getPlanVisit() async {
    ApiReturnValue<List<PlanVisitModel>> result =
        await PlanVisitServices.getPlanVisit();

    if (result.value != null) {
      listPlan = result.value!;
      update(['planvisit']);
    }
  }

  void updateManual() {
    update(['dropdown']);
  }

  Future<List<RegionModel>> getRegion(String divisi) async {
    ApiReturnValue<List<RegionModel>> result =
        await TmServices.getregion(divisi);

    if (result.value!.length != 0) {
      return result.value!;
    } else {
      notif("Error", result.message!);
      return [];
    }
  }

  void notif(String judul, String msg) {
    Get.snackbar('title', 'message',
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(10),
        titleText:
            Text(judul, style: blackFontStyle1.copyWith(color: Colors.white)),
        messageText:
            Text(msg, style: blackFontStyle2.copyWith(color: Colors.white)),
        backgroundColor: Colors.red[900]);
  }

  Future<void> getDetailUser() async {
    ApiReturnValue<UserModel> result = await UserServices.getSingleUser();
    if (result.value != null) {
      user = result.value;
      update(['profile', 'logo']);
    }
  }

  Future<List<DivisiModel>> getdivisi() async {
    ApiReturnValue<List<DivisiModel>> result = await TmServices.getDivisi();

    if (result.value!.length != 0) {
      return result.value!;
    } else {
      notif("Error", result.message!);
      return [];
    }
  }

  @override
  void onInit() async {
    getPlanVisit();
    getDetailUser();
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? id = pref.getInt('role');
    if (id != null && id == 1) {
      await getdivisi().then((value) => divisi = value);
    }
    super.onInit();
  }
}
