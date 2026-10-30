import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/utils/flush_bar_helper.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/utils/validations.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/login/presentation/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formkey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: Scaffold(
        appBar: AppBar(title: Text('L O G I N')),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                BlocBuilder<LoginBloc, LoginInitialState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          EmailChangeEvent(email: value),
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }
                        if (!Validations.emailValidator(value)) {
                          return 'Enter correct email';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<LoginBloc, LoginInitialState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    return TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          PasswordChangeEvent(password: value),
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        } else if (value.length < 6) {
                          return 'Please enter 6 digit password';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                SizedBox(height: 50),
                BlocListener<LoginBloc, LoginInitialState>(
                  listenWhen: (previous, current) =>
                      current.loginStatus != previous.loginStatus,
                  listener: (context, state) {
                    switch (state.loginStatus) {
                      case LoginStatus.error:
                      FlushBarHelper.flushBarErrorMessage(
                          state.message.toString(),
                        context);
                        // ScaffoldMessenger.of(context)
                        //   ..hideCurrentSnackBar()
                        //   ..showSnackBar(
                        //     SnackBar(content: Text(state.message.toString())),
                        //   );
                      case LoginStatus.loading:
                       FlushBarHelper.flushBarErrorMessage(
                          "Submitting",
                          context,
                        );
                        // ScaffoldMessenger.of(context)
                        //   ..hideCurrentSnackBar()
                        //   ..showSnackBar(SnackBar(content: Text('Submitting')));
                      case LoginStatus.success:
                       FlushBarHelper.flushBarSuccessMessage(
                          'Login Successful',
                          context,
                        );
                        // ScaffoldMessenger.of(context)
                        //   ..hideCurrentSnackBar()
                        //   ..showSnackBar(
                        //     SnackBar(content: Text('Login Successful')),
                        //   );
                        break;
                      default:
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginInitialState>(
                    buildWhen: (previous, current) =>
                        current.loginStatus != previous.loginStatus,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {}
                          context.read<LoginBloc>().add(LoginApiEvent());
                        },
                        child: state.loginStatus == LoginStatus.loading
                            ? CircularProgressIndicator()
                            : Text('Login'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
