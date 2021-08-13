part of 'controllers.dart';

class HomePageController extends GetxController {
  var selectedIndex = 0.obs;
  List<PlanVisitModel> listPlan = [];
  String? month;
  int? bulan;

  static String getIntMonth(DateTime? now) {
    return new DateFormat("M").format(now!);
  }

  Future<void> getPlanData(int id, int month) async {
    ApiReturnValue<List<PlanVisitModel>> result =
        await PlanVisitServices.getPlanVisit(id, month);

    if (result.value != null) {
      listPlan = result.value!;
    }
  }

  @override
  void onInit() {
    month = DateFormat("M").format(DateTime.now());
    if (month == "8") {
      bulan = 8;
    }
    getPlanData(1, bulan!);
    super.onInit();
  }
}
