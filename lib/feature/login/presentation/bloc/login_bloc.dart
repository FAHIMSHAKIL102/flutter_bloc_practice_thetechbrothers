import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginInitialState> {
  LoginBloc() : super(LoginInitialState()) {
    on<EmailChangeEvent>(_emailChangeEvent);
    on<PasswordChangeEvent>(_passwordChangeEvent);
    on<LoginApiEvent>(_loginApiEvent);
  }

  FutureOr<void> _emailChangeEvent(
    EmailChangeEvent event,
    Emitter<LoginInitialState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordChangeEvent(
    PasswordChangeEvent event,
    Emitter<LoginInitialState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _loginApiEvent(
    LoginApiEvent event,
    Emitter<LoginInitialState> emit,
  ) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    Map data = {'email': state.email, 'password': state.password};

    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: data,
      );
      final test = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.success,
            message: 'Successful',
          ),
        );
      } else {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.error,
            message: test['error'],
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(loginStatus: LoginStatus.error, message: e.toString()),
      );
    }
  }
}
