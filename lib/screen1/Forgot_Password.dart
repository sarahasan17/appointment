import 'package:appointment/screen1/firstscreen2.dart';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:appointment/screen1/signup.dart';
import 'package:appointment/auth/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:appointment/auth/cubit.dart';
import 'package:appointment/auth/forgot_password.dart';

Future part() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  return (Forgot_password(camera: firstCamera));
}

class Forgot_password extends StatefulWidget {
  final CameraDescription camera;
  const Forgot_password({required this.camera});

  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

class _Forgot_passwordState extends State<Forgot_password> {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  bool _isButtonDisabled = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => LoginCubit(),
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
                    'FORGOT PASSWORD',
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
                  controller: email,
                  key: _emailKey,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _isButtonDisabled = _emailKey.currentState!.isValid;
                    _emailKey.currentState?.validate();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  decoration:
                      kinputdecoration.copyWith(hintText: 'Enter your email'),
                ),
                Text_App(
                    text: 'CONTINUE',
                    colors: blue,
                    onPress: () {
                      BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                        listener: (context, state) {
                          if (state is ForgotPasswordSuccess) {
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
                          if (state is LoginLoading) {
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