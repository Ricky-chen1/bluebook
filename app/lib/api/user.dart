import 'package:http/http.dart' as http;
import 'dart:convert';

class UserAPI {
  static const String rootPath = '/book/user';
  static const String registerPath = '$rootPath/register';
  static const String loginPath = '$rootPath/login';
  static const String resetPasswordPath = '$rootPath/reset_password';

  /// 用户注册
  static Future<http.Response> sendRegisterReq(String account,String password,String role) async {
    var url = Uri.parse('http://127.0.0.1:8080$registerPath');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account' : account,
        'password': password,
        'role':role,
      }),
    );
    return response;
  }

  /// 用户登录
  static Future<http.Response> sendLoginReq(String account, String password) async {
    var url = Uri.parse('http://localhost:8080$loginPath');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': account,
        'password': password,
      }),
    );
    return response;
  }
}