part of 'controllers.dart';

class CiCoController extends GetxController {
  String? selectedOutlet;
  double? latOutlet, longOutlet;
  List<VisitModel> visits = [];
  List<PlanVisitModel> planVisit = [];
  List<String> showList = [];
  var isplaned = false.obs;

  Future<void> getPlan(int id) async {
    ApiReturnValue<List<PlanVisitModel>> result =
        await PlanVisitServices.getPlanVisit(1, 8);

    if (result.value != null) {
      planVisit = result.value!;
      List<String> namaOutlet = planVisit.map((e) => e.namaOutlet!).toList();
      showList = namaOutlet;
    }
    update();
  }

  void changeListPlaned() {
    selectedOutlet = null;
    isplaned.toggle();
    update();
  }

  Future<void> getVisit(int id) async {
    ApiReturnValue<List<VisitModel>> result = await VisitServices.getAll(id);

    if (result.value != null) {
      visits = result.value!;
    }

    update();
  }

  void extraCall() async {
    if (isplaned.value) {
      ApiReturnValue<List<OutletModel>> result =
          await OutletServices.getOutlet(1);
      if (result.value != null) {
        List<String> outletName =
            result.value!.map((e) => e.namaOutlet!).toList();
        Set setPlan = Set.from(showList);
        Set setOutlet = Set.from(outletName);

        List<String> data = List.from(setOutlet.difference(setPlan));
        showList = data;
      }
    } else {
      getPlan(1);
    }
    update();
  }

  @override
  void onInit() {
    getPlan(1);
    getVisit(1);
    super.onInit();
  }

  void newSelected(String value) {
    selectedOutlet = value;
    print(selectedOutlet);
    update();
  }
}
