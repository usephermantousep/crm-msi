part of 'services.dart';

class PlanVisitServices {
  static Future<ApiReturnValue<List<PlanVisitModel>>> getPlanVisit(
      int idSales, int month) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockPlan);
  }

  static Future<ApiReturnValue<List<PlanVisitModel>>> getPlanbyMonth(
      int idSales, int month) async {
    await Future.delayed(Duration(milliseconds: 500));
    if (month == 8) {
      return ApiReturnValue(value: mockPlan);
    } else {
      return ApiReturnValue(value: []);
    }
  }

  static Future<ApiReturnValue<PlanVisitModel>> addPlanVisit(
      PlanVisitModel data) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: data);
  }
}
