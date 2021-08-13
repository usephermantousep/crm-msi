import 'package:bloc/bloc.dart';
import 'package:crm_msi/model/models.dart';
import 'package:crm_msi/services/services.dart';
import 'package:equatable/equatable.dart';

part 'visit_state.dart';

class VisitCubit extends Cubit<VisitState> {
  VisitCubit() : super(VisitInitial());

  Future<void> getVisitBySales(
    int id,
  ) async {
    ApiReturnValue<List<VisitModel>> result = await VisitServices.getAll(id);
    if (result.value != null) {
      emit(VisitLoaded(result.value!));
    } else {
      emit(VisitLoadingFailed(result.message!));
    }
  }
}
