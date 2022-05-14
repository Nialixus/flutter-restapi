part of 'login.dart';

/// Separating [BlocListener] from [Login].
class LoginListener extends StatelessWidget {
  /// A widget to listen [LoginCubit].
  const LoginListener({Key? key, required this.child}) : super(key: key);

  /// [BlocListener]'s child.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous != current,
      listener: (listen, state) {
        // [LoginLoading] displaying circular icon
        if (state is LoginLoading) {
          showDialog(
              context: listen,
              barrierDismissible: false,
              builder: (listen) => const Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 7.5,
                      color: Color(0xff21BDC6),
                      backgroundColor: Color(0xff384647))));
        }
        // [LoginSucceed] redirecting user to [Dashboard].
        else if (state is LoginSucceed) {
          Navigator.pop(listen);
          Navigator.push(
              listen,
              MaterialPageRoute(
                builder: (listen) => BlocProvider(
                    create: (listen) => DashboardCubit(),
                    child: const Dashboard()),
              ));
        }
        // [LoginFailed] displaying alert message.
        else if (state is LoginFailed) {
          Navigator.pop(listen);
          showDialog(
              context: listen,
              builder: (listen) => AlertDialog(content: Text(state.message)));
        }
      },
      child: child,
    );
  }
}
