import 'dart:io';
import 'package:appointment/requests/signup_request.dart';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/requests/cubit.dart';
import 'package:appointment/screen1/login_page.dart';
import 'firstscreen2.dart';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';

class Loadingscreen extends StatelessWidget {
  const Loadingscreen({Key? key}) : super(key: key);

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
  return (Signup(camera: firstCamera));
}

class Signup extends StatefulWidget {
  final CameraDescription camera;
  const Signup({required this.camera});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  final GlobalKey<FormFieldState> _nameKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _phoneKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _ageKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordConfirmKey =
      GlobalKey<FormFieldState>();
  @override
  void initState() {
    super.initState();
  }

  bool _isButtonDisabled = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => SignupCubit(),
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
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 100.0,
                        ),
                        const Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: blue,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 48.0,
                        ),
                        TextField(
                          textAlign: TextAlign.left,
                          key: _nameKey,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            _isButtonDisabled = _nameKey.currentState!.isValid;
                            _nameKey.currentState?.validate();
                            validator:
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                            };
                          },
                          decoration: kinputdecoration.copyWith(
                              hintText: 'Enter your name'),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          textAlign: TextAlign.left,
                          key: _emailKey,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _isButtonDisabled = _emailKey.currentState!.isValid;
                            _emailKey.currentState?.validate();
                            validator:
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                            };
                          },
                          decoration: kinputdecoration.copyWith(
                              hintText: 'Enter your phone'),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          textAlign: TextAlign.left,
                          key: _phoneKey,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _isButtonDisabled = _phoneKey.currentState!.isValid;
                            _phoneKey.currentState?.validate();
                            validator:
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              ;
                            };
                          },
                          decoration: kinputdecoration.copyWith(
                              hintText: 'Enter your phone number'),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          textAlign: TextAlign.left,
                          key: _ageKey,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _isButtonDisabled = _ageKey.currentState!.isValid;
                            _ageKey.currentState?.validate();
                            validator:
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              ;
                            };
                          },
                          decoration: kinputdecoration.copyWith(
                              hintText: 'Enter your age'),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          textAlign: TextAlign.left,
                          key: _passwordKey,
                          obscureText: true,
                          onChanged: (value) {
                            _isButtonDisabled =
                                _passwordKey.currentState!.isValid;
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              color: blue,
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                child: const Text(
                                  'UPLOAD PIC',
                                  style: TextStyle(color: white),
                                ),
                                onTap: () async {
                                  final result =
                                      await FilePicker.platform.pickFiles();
                                  if (result == null) return;
                                  final file = result.files.first;
                                  openFile(file);
                                  print('Name: ${file.name}');
                                  print('Bytes: ${file.bytes}');
                                  print('Size: ${file.size}');
                                  print('Extension: ${file.extension}');
                                  print('Path: ${file.path}');
                                },
                              ),
                            ),
                          ],
                        ),
                        Text_App(
                            text: 'SIGN UP',
                            colors: blue,
                            onPress: () {
                              BlocConsumer<SignupCubit, SignupState>(
                                  listener: (context, state) {
                                if (state is LoginSuccess) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Firstscreen2(
                                              camera: widget.camera)));
                                }
                                if (state is SignupError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Enter valid Data'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }, builder: (context, state) {
                                if (state is SignupLoading) {
                                  return const Loadingscreen();
                                }
                                return Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: const [
                                    Text(
                                      'Correct info',
                                      style: TextStyle(color: blue),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      color: Colors.green,
                                    ),
                                  ],
                                );
                              });
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void openFile(PlatformFile file) {
  OpenFilex.open(file.path!);
}

class Text_App extends StatelessWidget {
  final Color? colors;
  final VoidCallback? onPress;
  final String text;
  Text_App({this.colors, this.onPress, this.text = ''});
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
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
