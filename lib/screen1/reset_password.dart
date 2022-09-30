import 'package:appointment/screen1/firstscreen2.dart';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:appointment/screen1/signup.dart';
import 'package:appointment/auth/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:appointment/auth/cubit.dart';
import 'package:appointment/auth/forgot_password.dart';
import 'package:appointment/auth/reset_password.dart';

Future part() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  return (Reset_password(camera: firstCamera));
}

class Reset_password extends StatefulWidget {
  final CameraDescription camera;
  const Reset_password({required this.camera});

  @override
  State<Reset_password> createState() => _Reset_passwordState();
}

class _Reset_passwordState extends State<Reset_password> {
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  final GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordConfirmKey =
      GlobalKey<FormFieldState>();
  bool _isButtonDisabled = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ResetPasswordCubit(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: blue,
            title: const Center(
              child: Text(
                "Daily reminder",
                style: TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.w600, color: white),
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'RESET PASSWORD',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        color: blue),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  textAlign: TextAlign.left,
                  key: _passwordKey,
                  obscureText: true,
                  onChanged: (value) {
                    _isButtonDisabled = _passwordKey.currentState!.isValid;
                    _passwordKey.currentState?.validate();
                    validator:
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    };
                  },
                  decoration: kinputdecoration.copyWith(
                      hintText: 'Enter your password.'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  textAlign: TextAlign.left,
                  key: _passwordConfirmKey,
                  obscureText: true,
                  onChanged: (value) {
                    _isButtonDisabled =
                        _passwordConfirmKey.currentState!.isValid;
                    _passwordConfirmKey.currentState?.validate();
                    validator:
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    };
                  },
                  decoration: kinputdecoration.copyWith(
                      hintText: 'Confirm your password'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text_App(
                    text: 'CONTINUE',
                    colors: blue,
                    onPress: () {
                      BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                        listener: (context, state) {
                          if (state is ResetPasswordSuccess) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Firstscreen2(camera: widget.camera)));
                          }
                          if (state is LoginError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Enter valid Data'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is ResetPasswordLoading) {
                            return const Loadingscreen();
                          }
                          return Container();
                        },
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
