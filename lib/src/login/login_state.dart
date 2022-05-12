part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final String data;
  const LoginState(this.data);

  @override
  List<Object> get props => [data];
}

class LoginInitial extends LoginState {
  const LoginInitial() : super('No Data');
}

class LoginSucceed extends LoginState {
  final String newData;
  const LoginSucceed(this.newData) : super(newData);
}
