//signupRequest
class SignupRequest {
  SignupRequest({
    this.name,
    this.email,
    this.phone,
    this.age,
    this.password,
    this.passwordConfirm,
  });

  final String? name;
  final String? email;
  final String? phone;
  final int? age;
  final String? password;
  final String? passwordConfirm;

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
    required this.id,
    required this.twoFactorSessionId,
    required this.mobileNumber,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.jerseyNumber,
    required this.isVerified,
    required this.matchesOrganised,
    required this.teams,
    required this.v,
  });

  final String id;
  final String twoFactorSessionId;
  final int mobileNumber;
  final String name;
  final String gender;
  final DateTime dateOfBirth;
  final int jerseyNumber;
  final bool isVerified;
  final List<dynamic> matchesOrganised;
  final List<dynamic> teams;
  final int v;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        twoFactorSessionId: json["twoFactorSessionID"],
        mobileNumber: json["mobileNumber"],
        name: json["name"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        jerseyNumber: json["jerseyNumber"],
        isVerified: json["isVerified"],
        matchesOrganised:
            List<dynamic>.from(json["matchesOrganised"].map((x) => x)),
        teams: List<dynamic>.from(json["teams"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "twoFactorSessionID": twoFactorSessionId,
        "mobileNumber": mobileNumber,
        "name": name,
        "gender": gender,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "jerseyNumber": jerseyNumber,
        "isVerified": isVerified,
        "matchesOrganised": List<dynamic>.from(matchesOrganised.map((x) => x)),
        "teams": List<dynamic>.from(teams.map((x) => x)),
        "__v": v,
      };
}
