import 'package:bloc/bloc.dart';
import 'package:crm_msi/model/models.dart';
import 'package:crm_msi/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login(String userName, String password) async {
    ApiReturnValue<UserModel> result =
        await UserServices.signIn(userName, password);
    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }
}
