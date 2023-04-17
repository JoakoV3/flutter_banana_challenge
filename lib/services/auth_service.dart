import 'package:dio/dio.dart';
import 'package:flutter_banana_challenge/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final url = 'https://dummyjson.com';
  final storage = const FlutterSecureStorage();
  final dio = Dio();

  Future<String> getToken() async {
    return await storage.read(key: 'auth_token') ?? '';
  }

  Future<UserModel> login(String email, String password) async {
    // authenticate user using email and password
    UserModel user = await _authenticateUser(email, password);
    // store authentication token
    await storage.write(key: 'auth_token', value: user.token);
    return user;
  }

  Future<void> logout() async {
    // delete authentication token
    await storage.delete(key: 'auth_token');
  }

  Future<bool> isAuthenticated() async {
    // check if authentication token exists
    String? token = await storage.read(key: 'auth_token');
    return token != null;
  }

  Future<UserModel> _authenticateUser(String userName, String password) async {
    try {
      //Call the api to authenticate user
      final response = await dio.post(
        '$url/auth/login',
        data: {'username': userName, 'password': password},
      );
      final user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      //Return empty model
      return UserModel.empty;
    }
  }
}
