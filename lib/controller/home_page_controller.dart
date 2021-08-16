part of 'controllers.dart';

class HomePageController extends GetxController {
  int selectedIndex = 0;
  List<PlanVisitModel> listPlan = [];
  String? month;
  int? bulan;

  Future<void> getPlanData(int id, int month) async {
    ApiReturnValue<List<PlanVisitModel>> result =
        await PlanVisitServices.getPlanVisit(id, month);

    if (result.value != null) {
      listPlan = result.value!;
      update();
    }
    update();
  }

  @override
  void onInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? userId = pref.getInt('userId');
    print(userId);

    month = DateFormat("M").format(DateTime.now());
    if (month == "8") {
      bulan = 8;
    }
    getPlanData(userId!, bulan!);
    super.onInit();
  }
}
