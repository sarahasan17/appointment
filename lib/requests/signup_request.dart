//signupRequest
class SignupRequest {
  SignupRequest({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.age = 0,
    this.password = '',
    this.passwordConfirm = '',
  });

  final String name;
  final String email;
  final String phone;
  final int age;
  final String password;
  final String passwordConfirm;

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        age: json["age"],
        password: json["password"],
        passwordConfirm: json["passwordConfirm"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "age": age,
        "password": password,
        "passwordConfirm": passwordConfirm,
      };
}

//signupState
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final SignupResponse response;

  SignupSuccess(this.response);
}

class SignupError extends SignupState {
  final String msg;

  SignupError(this.msg);
}

//loginState
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginSuccess();
}

class LoginError extends LoginState {
  final String msg;

  LoginError(this.msg);
}

//SignupResponse
class SignupResponse {
  SignupResponse({
    required this.message,
    required this.result,
  });

  final String message;
  final Result result;

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
    required this.password,
    required this.confirmPassword,
  });

  final String name;
  final String email;
  final String phone;
  final int age;
  final String password;
  final DateTime confirmPassword;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        age: json["age"],
        password: json["password"],
        confirmPassword: DateTime.parse(json["confirmPassword"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "age": age,
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
