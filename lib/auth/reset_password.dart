import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:appointment/auth/api_call.dart';
import 'package:bloc/bloc.dart';

//reset password repo
class ResetpasswordRepo {
  final Dio _dio = Dio();
  final NetworkInfoImpl _networkInfo = NetworkInfoImpl();

  Future<dynamic> ResetPassword(String password, String passwordConfirm) async {
    String url =
        '{{devjams-production.up.railway.app}}/api/v1/users/resetPassword/16af422f5d6306b19b3d91119fca37dee3b2f94552eab1f8c4cc58e7e75cad7c';
    if (await _networkInfo.isConnected()) {
      try {
        final Response response = await _dio.post(
          url,
          data: jsonEncode(
              {'password': password, 'passwordConfirm': passwordConfirm}),
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

//resetpasswordCubit
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  final ResetpasswordRepo _ResetpasswordRepo = ResetpasswordRepo();

  void ResetPassword(String password, String passwordConfirm) async {
    emit(ResetPasswordLoading());
    var res = await _ResetpasswordRepo.ResetPassword(password, passwordConfirm);
    res.fold((l) => emit(ResetPasswordError(l.message)),
        (r) => emit(ResetPasswordSuccess()));
  }
}

//resetpasswordstate
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  ResetPasswordSuccess();
}

class ResetPasswordError extends ResetPasswordState {
  final String msg;

  ResetPasswordError(this.msg);
}
