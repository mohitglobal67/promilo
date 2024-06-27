import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:promilo/networking/repository/loginrepo/loginrepo.dart';
import 'package:promilo/utils/enum.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();

  LoginBloc() : super(LoginState()) {
    on<EmailChange>(_onEmailchanged);
    on<PasswordChange>(_onPasswordchanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailchanged(EmailChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordchanged(PasswordChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    final password = state.password;
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();
// 'test45@yopmail.com',
// "Test@123";
    Map data = {
      'username': state.email,
      'password': hashedPassword,
      'grant_type': 'password',
    };

    emit(state.copyWith(
      postApiStatus: PostApiStatus.loading,
    ));
    await loginRepository.loginapi(data).then((value) async {
      if (value.status!.message != null) {
        emit(state.copyWith(
          message: value.status!.message..toString(),
          postApiStatus: PostApiStatus.error,
        ));
      } else {
        emit(state.copyWith(
            message: value.response!.userName,
            postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: error.toString(), postApiStatus: PostApiStatus.error));
    });
  }
}
