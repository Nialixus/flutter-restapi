part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {}

class DashboardLoading extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoaded extends DashboardState {
  DashboardLoaded({required this.response});
  final DashboardResponse response;

  @override
  List<Object> get props => [response];
}

class DashboardError extends DashboardState {
  DashboardError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
