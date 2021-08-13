part of 'noo_cubit.dart';

abstract class NooState extends Equatable {
  const NooState();

  @override
  List<Object> get props => [];
}

class NooInitial extends NooState {}

class NooLoaded extends NooState {
  final List<NooModel> noos;

  NooLoaded(this.noos);

  @override
  List<Object> get props => [noos];
}

class NooLoadingFailed extends NooState {
  final String message;

  NooLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
