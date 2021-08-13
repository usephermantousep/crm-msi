import 'package:bloc/bloc.dart';
import 'package:crm_msi/model/models.dart';
import 'package:crm_msi/services/services.dart';
import 'package:equatable/equatable.dart';

part 'noo_state.dart';

class NooCubit extends Cubit<NooState> {
  NooCubit() : super(NooInitial());

  Future<void> getNooBysales(int id) async {
    ApiReturnValue<List<NooModel>> result = await NooService.bySales(id);

    if (result.value != null) {
      emit(NooLoaded(result.value!));
    } else {
      emit(NooLoadingFailed(result.message!));
    }
  }
}
