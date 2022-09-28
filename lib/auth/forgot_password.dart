import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:appointment/auth/api_call.dart';
import 'package:bloc/bloc.dart';

//forgot password repo
class ForgotpasswordRepo {
  final Dio _dio = Dio();
  final NetworkInfoImpl _networkInfo = NetworkInfoImpl();

  Future<dynamic> forgotpassword(String email) async {
    String url =
        '{{devjams-production.up.railway.app}}/api/v1/users/forgotPassword';
    if (await _networkInfo.isConnected()) {
      try {
        final Response response = await _dio.post(
          url,
          data: jsonEncode({'email': email}),
        );

        var body = response.data as Map<String, dynamic>;
        if (response.statusCode == 200) {
          return Right(body);
        } else {
          return Left(body);
        }
      } catch (e) {
        Failure(message: 'Error');
      }
    }
  }
}

//forgotpasswordCubit
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
  final ForgotpasswordRepo _forgotpasswordRepo = ForgotpasswordRepo();

  void ForgotPassword(String email) async {
    emit(ForgotPasswordLoading());
    var res = await _forgotpasswordRepo.forgotpassword(email);
    res.fold((l) => emit(ForgotPasswordError(l.message)),
        (r) => emit(ForgotPasswordSuccess()));
  }
}

//forgotpasswordstate
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  ForgotPasswordSuccess();
}

class ForgotPasswordError extends ForgotPasswordState {
  final String msg;

  ForgotPasswordError(this.msg);
}
