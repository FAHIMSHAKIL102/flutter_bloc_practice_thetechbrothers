import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/login/presentation/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  late LoginBloc _loginBloc;

  @override
  void initState() {
    // TODO: implement initState
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
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              SizedBox(height: 50),
              BlocListener<LoginBloc, LoginInitialState>(
                listener: (context, state) {
                  switch (state.loginStatus) {
                    case LoginStatus.error:
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text(state.message.toString())),
                        );
                         case LoginStatus.loading:
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text('Submitting')),
                        );
                         case LoginStatus.success:
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text('Logiin Successful')),
                        );
                      break;
                    default:
                  }
                },
                child: BlocBuilder<LoginBloc, LoginInitialState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginApiEvent());
                      },
                      child: Text('Login'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
