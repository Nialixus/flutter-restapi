part of 'dashboard_cubit.dart';

/// Mother class of every state used in [DashboardCubit].
abstract class DashboardState extends Equatable {}

/// This state used while device fetching [DashboardArticle].
class DashboardLoading extends DashboardState {
  @override
  List<Object> get props => [];
}

/// This state used after fetching [DashboardArticle] done successfully.
class DashboardLoaded extends DashboardState {
  /// Fetching [DashboardResponse] and pass it to [Dashboard].
  DashboardLoaded({required this.response});

  /// Decoded [Response] which will be used in [Dashboard].
  final DashboardResponse response;

  @override
  List<Object> get props => [response];
}

/// This state used when fetching [DashboardArticle] throws exception.
class DashboardError extends DashboardState {
  /// Stating failed with error message.
  DashboardError({required this.message});

  /// Message to indicating what's gone wrong.
  final String message;

  @override
  List<Object> get props => [message];
}
