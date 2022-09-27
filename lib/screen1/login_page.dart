import 'dart:convert';
import 'package:appointment/screen1/firstscreen2.dart';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:appointment/screen1/signup.dart';
import 'package:appointment/requests/api_call.dart';
import 'package:appointment/requests/signup_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:auto_route/auto_route.dart';
import 'package:appointment/requests/cubit.dart';

class loadingscreen extends StatelessWidget {
  const loadingscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(blue),
    );
  }
}

Future part() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  return (details(camera: firstCamera));
}

class details extends StatefulWidget {
  final CameraDescription camera;
  details({required this.camera});
  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>();
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro-Regular',
                        color: blue,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  controller: emailcontroller,
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
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  key: _passwordKey,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    _isButtonDisabled = _passwordKey.currentState!.isValid;
                    _passwordKey.currentState?.validate();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  decoration: kinputdecoration.copyWith(
                      hintText: 'Enter your password.'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                  if (state is LoginSuccess) {
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
                }, builder: (context, state) {
                  if (state is LoginLoading) {
                    return const loadingscreen();
                  }
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        text_app(
                          text: 'LOG IN',
                          colors: blue,
                          onPress: () {
                            setState(() {
                              !_isButtonDisabled
                                  ? null
                                  : () {
                                      context.read<LoginCubit>().login(
                                          emailcontroller.text,
                                          passwordcontroller.text);
                                    };
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Don\'t have an account    ",
                              style: TextStyle(color: blue),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Signup(camera: widget.camera)),
                                );
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: blue),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                      ]);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class text_app extends StatelessWidget {
  final Color? colors;
  final VoidCallback? onPress;
  final String text;
  text_app({this.colors, this.onPress, this.text = ''});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colors,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
