import 'dart:developer';

import 'package:promilo/config/constant/appurl.dart';
import 'package:promilo/model/login/login_model.dart';
import 'package:promilo/networking/network/base_networking.dart';

class LoginRepository {
  final _api = NetworkServisesApi();

  Future<LoginModel> loginapi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginEndPint, data);

    // debugger();
    // print(response);
    return LoginModel.fromJson(response);
  }
}



//   void _login() async {
//     final email = _emailController.text;
//     final password = _passwordController.text;
//     final hashedPassword = sha256.convert(utf8.encode(password)).toString();

//     final response = await http.post(
//       Uri.parse('https://apiv2stg.promilo.com/user/oauth/token'),
//       headers: {
//         'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
//       },
//       body: {
//         'username': email,
//         'password': hashedPassword,
//         'grant_type': 'password',
//       },
//     );

//     if (response.statusCode == 200) {
//       debugger();
//       print(response.body);
//       // Navigator.pushReplacementNamed(context, '/home');
//       Navigator.pushNamedAndRemoveUntil(
//           context, RoutesName.loginScreen, (route) => false);
//     } else {
//       setState(() {
//         _errorMessage = 'Invalid ID Password';
//       });
//     }
//   }