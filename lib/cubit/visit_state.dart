part of 'visit_cubit.dart';

abstract class VisitState extends Equatable {
  const VisitState();

  @override
  List<Object> get props => [];
}

class VisitInitial extends VisitState {}

class VisitLoaded extends VisitState {
  final List<VisitModel> visit;

  VisitLoaded(this.visit);

  @override
  List<Object> get props => [visit];
}

class VisitLoadingFailed extends VisitState {
  final String message;

  VisitLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
