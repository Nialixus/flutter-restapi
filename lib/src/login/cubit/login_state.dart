part of 'login_cubit.dart';

/// Mother class of every state used in [LoginCubit].
abstract class LoginState extends Equatable {}

/// Initiate state with nothing.
class LoginInit extends LoginState {
  @override
  List<Object> get props => [];
}

/// State when [LoginCubit] is in idle after running [LoginCubit.auth].
class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

/// State when all conditions are met.
class LoginSucceed extends LoginState {
  /// Fetching [LoginResponse] from [LoginCubit.auth].
  LoginSucceed({required this.response});

  /// Successful output after running [LoginCubit.auth].
  final LoginResponse response;

  @override
  List<Object> get props => [response];
}

/// State when [LoginCubit] throw exception.
class LoginFailed extends LoginState {
  /// Stating failed with error message.
  LoginFailed({required this.message});

  /// Message to indicating what's gone wrong.
  final String message;

  @override
  List<Object> get props => [message];
}
