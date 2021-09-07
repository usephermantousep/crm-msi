part of 'controllers.dart';

class HomePageController extends GetxController {
  int selectedIndex = 0;
  List<PlanVisitModel> listPlan = [];
  String? month;
  int? bulan;

  Future<void> getPlanVisit() async {
    ApiReturnValue<List<PlanVisitModel>> result =
        await PlanVisitServices.getPlanVisit();

    if (result.value != null) {
      listPlan = result.value!;
      update(['planvisit']);
    }
    update();
  }

  @override
  void onInit() async {
    getPlanVisit();
    super.onInit();
  }
}
