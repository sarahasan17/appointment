import 'dart:convert';
import 'package:appointment/requests/signup_request.dart';
import 'package:appointment/screen1/signup.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

class Api_client {
  static const baseUrl = 'devjams-production.up.railway.app';
  final http.Client httpClient;
  Api_client({required this.httpClient}) : assert(httpClient != null);
  Future<SignupRequest> fetchData() async {
    final data = await httpClient.get(Uri.parse(baseUrl));
    if (data.statusCode != 200) {
      throw 'Something went wrong';
    }
    final dataJson = jsonDecode(data.body);
    return SignupRequest.fromJson(dataJson);
  }
}

//networkinfo
abstract class NetwrokInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetwrokInfo {
  @override
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}

//failure
class Failure {
  final String message;
  Failure({required this.message});
}

//login repo
class LoginRepo {
  final Dio _dio = Dio();
  final NetworkInfoImpl _networkInfo = NetworkInfoImpl();

  Future<dynamic> login(String email, String password) async {
    String url = '{{devjams-production.up.railway.app}}/api/v1/users/login';
    if (await _networkInfo.isConnected()) {
      try {
        final Response response = await _dio.post(
          url,
          data: jsonEncode({'email': email, 'password': password}),
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

//sign up repo
class SignupRepo {
  final Dio _dio = Dio();
  final NetworkInfoImpl _networkInfo = NetworkInfoImpl();

  Future<dynamic> login(String name, String email, String phone, String age,
      String password, String passwordConfirm) async {
    String url = '{{devjams-production.up.railway.app}}/api/v1/users/signup';
    if (await _networkInfo.isConnected()) {
      try {
        final Response response = await _dio.post(
          url,
          data: jsonEncode({
            'name': name,
            'email': email,
            'phone': phone,
            'age': age,
            'password': password,
            'passwordConfirm': passwordConfirm
          }),
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
