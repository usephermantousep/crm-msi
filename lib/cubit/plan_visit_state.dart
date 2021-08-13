part of 'plan_visit_cubit.dart';

abstract class PlanVisitState extends Equatable {
  const PlanVisitState();

  @override
  List<Object> get props => [];
}

class PlanVisitInitial extends PlanVisitState {}

class PlanVisitLoaded extends PlanVisitState {
  final List<PlanVisitModel> data;

  PlanVisitLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class PlanVisitLoadingFailded extends PlanVisitState {
  final String message;

  PlanVisitLoadingFailded(this.message);

  @override
  List<Object> get props => [message];
}
