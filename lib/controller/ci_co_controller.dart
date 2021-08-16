part of 'controllers.dart';

class CiCoController extends GetxController {
  String? selectedOutlet;
  double? latOutlet, longOutlet;
  List<OutletModel> outlets = [];
  List<VisitModel> visits = [];

  Future<void> getOutlet(int id) async {
    ApiReturnValue<List<OutletModel>> result =
        await OutletServices.getOutlet(id);

    if (result.value != null) {
      outlets = result.value!;
    }
    update();
  }

  Future<void> getVisit(int id) async {
    ApiReturnValue<List<VisitModel>> result = await VisitServices.getAll(id);

    if (result.value != null) {
      visits = result.value!;
    }

    update();
  }

  @override
  void onInit() {
    getOutlet(1);
    getVisit(1);
    super.onInit();
  }

  void newSelected(String latlong) {
    List latLong = latlong.toString().split(",");
    for (int i = 0; i < latLong.length; i++) {
      if (i == 0) {
        latOutlet = double.parse(latLong[i]);
      } else {
        longOutlet = double.parse(latLong[i]);
      }
    }
    print(latOutlet.toString() + longOutlet.toString());
    selectedOutlet = latlong;
    update();
  }
}
