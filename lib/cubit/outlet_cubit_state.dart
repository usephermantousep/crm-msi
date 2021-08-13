part of 'outlet_cubit_cubit.dart';

abstract class OutletCubitState extends Equatable {
  const OutletCubitState();

  @override
  List<Object> get props => [];
}

class OutletCubitInitial extends OutletCubitState {}

class OutletLoaded extends OutletCubitState {
  final List<OutletModel> outlets;

  OutletLoaded(this.outlets);

  @override
  List<Object> get props => [outlets];
}

class OutletLoadingFailed extends OutletCubitState {
  final String message;

  OutletLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
