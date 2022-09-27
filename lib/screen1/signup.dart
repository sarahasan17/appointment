import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/requests/cubit.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

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
          body: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                  decoration:
                      kinputdecoration.copyWith(hintText: 'Enter your name'),
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
                  decoration:
                      kinputdecoration.copyWith(hintText: 'Enter your email'),
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
                  decoration:
                      kinputdecoration.copyWith(hintText: 'Enter your age'),
                ),
                const SizedBox(
                  height: 10.0,
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
                Text_app(
                  text: 'SIGN UP',
                  colors: blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Text_app extends StatelessWidget {
  final Color? colors;
  final VoidCallback? onPress;
  final String text;
  Text_app({this.colors, this.onPress, this.text = ''});
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
