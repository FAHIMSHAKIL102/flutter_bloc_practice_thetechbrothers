part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitialState extends LoginState {
  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  const LoginInitialState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial,
  });

  LoginInitialState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginStatus,
  }) {
    return LoginInitialState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object> get props => [email, password, message, loginStatus];
}
