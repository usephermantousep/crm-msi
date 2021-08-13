import 'package:bloc/bloc.dart';
import 'package:crm_msi/model/models.dart';
import 'package:crm_msi/services/services.dart';
import 'package:equatable/equatable.dart';

part 'plan_visit_state.dart';

class PlanVisitCubit extends Cubit<PlanVisitState> {
  PlanVisitCubit() : super(PlanVisitInitial());

  Future<void> getPlanVisit(int idSales, int? month) async {
    ApiReturnValue<List<PlanVisitModel>> result =
        await PlanVisitServices.getPlanVisit(idSales, month!);
    if (result.value != null) {
      emit(PlanVisitLoaded(result.value!));
    } else {
      emit(PlanVisitLoadingFailded(result.message!));
    }
  }

  Future<void> getPlanByMonth(int idSales, int? month) async {
    ApiReturnValue<List<PlanVisitModel>> result =
        await PlanVisitServices.getPlanbyMonth(idSales, month!);

    if (result.value != null) {
      emit(PlanVisitLoaded(result.value!));
    } else {
      emit(PlanVisitLoadingFailded(result.message!));
    }
  }

  Future<void> addPlanVisit(PlanVisitModel data) async {
    ApiReturnValue<PlanVisitModel> result =
        await PlanVisitServices.addPlanVisit(data);

    if (result.value != null) {
      emit(PlanVisitLoaded((state as PlanVisitLoaded).data + [result.value!]));
    } else {
      emit(PlanVisitLoadingFailded(result.message!));
    }
  }
}
