part of 'controllers.dart';

class ProfileController extends GetxController {
  int selectedIndex = 0;
  List<VisitModel>? visit;
  List<OutletModel>? outlets;
  int? badanUsaha;
  int? role;
  List<DivisiModel>? divisi;
  List<RegionModel>? region;
  String? selectedDivisi;
  String? selectedRegion;
  List<VisitModel>? visitMonitor;
  DateTime date = DateTime.now();

  Future<bool> getDataOutlet({String? region, String? divisi}) async {
    ApiReturnValue<List<OutletModel>> result =
        await OutletServices.getOutlet(region: region, divisi: divisi);

    if (result.value != null) {
      outlets = result.value!;
      update(['outlet']);
      return true;
    }

    return false;
  }

  void loading() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(defaultMargin),
        barrierDismissible: false,
        title: "Loading ....",
        titleStyle: blackFontStyle1,
        middleText: 'Mengambil data Outlet',
        actions: [
          Center(
            child: CircularProgressIndicator(),
          )
        ]);
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

  void updateManual() {
    update(['dropdown']);
  }

  Future<void> getVisited() async {
    ApiReturnValue<List<VisitModel>> result = await VisitServices.getVisit();

    if (result.value != null) {
      visit = result.value!;
      update(['outlet']);
    }
  }

  Future<void> load() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    badanUsaha = pref.getInt('badanusaha');
    role = pref.getInt('role');
    update();
  }

  void changePage(int index) {
    selectedIndex = index;
    update(['tab', 'outlet']);
  }

  Future<bool> logout() async {
    ApiReturnValue<bool> result = await UserServices.logout();

    if (result.value != null) {
      if (result.value!) {
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

  Future<List<DivisiModel>> getdivisi() async {
    ApiReturnValue<List<DivisiModel>> result = await TmServices.getDivisi();

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

  Future<void> getMonitor({required DateTime date}) async {
    ApiReturnValue<List<VisitModel>> result =
        await VisitServices.getMonitorVisit(date: date);

    if (result.value != null) {
      visitMonitor = result.value!;
      update(['monitor']);
    }
  }

  void changeDate(DateTime date) {
    this.date = date;
    getMonitor(date: date);
  }

  @override
  void onInit() async {
    getVisited();
    load();
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? id = pref.getInt('role');
    if (id == 1) {
      await getdivisi().then((value) => divisi = value);
    } else {
      getDataOutlet();
    }
    if (id == 1 || id == 2) {
      getMonitor(date: date);
    }
    super.onInit();
  }
}
