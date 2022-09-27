import 'dart:convert';
import 'package:appointment/requests/signup_request.dart';
import 'package:appointment/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:appointment/requests/api_call.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final LoginRepo _loginRepo = LoginRepo();
  void login(String email, String password) async {
    emit(LoginLoading());
    var res = await _loginRepo.login(email, password);
    res.fold((l) => emit(LoginError(l.message)), (r) => emit(LoginSuccess()));
  }
}

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
}
