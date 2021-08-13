import 'package:bloc/bloc.dart';
import 'package:crm_msi/model/models.dart';
import 'package:crm_msi/services/services.dart';
import 'package:equatable/equatable.dart';

part 'outlet_cubit_state.dart';

class OutletCubitCubit extends Cubit<OutletCubitState> {
  OutletCubitCubit() : super(OutletCubitInitial());

  Future<void> getOutlet(int id) async {
    ApiReturnValue<List<OutletModel>> result =
        await OutletServices.getOutlet(id);
    if (result.value != null) {
      emit(OutletLoaded(result.value!));
    } else {
      emit(OutletLoadingFailed(result.message!));
    }
  }
}
