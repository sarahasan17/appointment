import 'package:appointment/auth/state.dart';
import 'package:bloc/bloc.dart';
import 'package:appointment/auth/api_call.dart';

//loginCubit
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final LoginRepo _loginRepo = LoginRepo();
  void login(String email, String password) async {
    emit(LoginLoading());
    var res = await _loginRepo.login(email, password);
    res.fold((l) => emit(LoginError(l.message)), (r) => emit(LoginSuccess()));
  }
}

//signupcubit
class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final SignupRepo _signupRepo = SignupRepo();

  void signup(String name, String email, String phone, String age,
      String password, String passwordConfirm) async {
    emit(SignupLoading());
    var res = await _signupRepo.signup(
        name, email, phone, age, password, passwordConfirm);
    res.fold(
        (l) => emit(SignupError(l.message)), (r) => emit(SignupSuccess(res)));
  }
}
