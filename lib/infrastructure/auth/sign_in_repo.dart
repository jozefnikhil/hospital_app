import 'dart:developer';
import 'dart:io';

import 'package:amrita_treatment/core/app_constants.dart';
import 'package:amrita_treatment/domain/auth/i_sign_in.dart';
import 'package:amrita_treatment/domain/auth/signin/signin.dart';
import 'package:dio/dio.dart';

class SignInRepo implements ISignIn {
  @override
  Future<Signin?> signin({
    required String username,
    required String password,
  }) async {
    final logincredentials = FormData.fromMap({
      "username": username,
      "password": password,
    });
    try {
      final Response response =
          await Dio(BaseOptions(baseUrl: AppConstants.baseurl)).post(
            "Login",
            data: logincredentials,
            options: Options(
              contentType: Headers.multipartFormDataContentType,
              validateStatus: (status) => true, // allow all status codes
            ),
          );
      log("Response status: ${response.statusCode}");
      log("Response data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonData =
            response.data as Map<String, dynamic>;

        // Log parsed JSON
        log("Parsed JSON: $jsonData");

        // Check for API errors
        if (jsonData['status'] == false ||
            jsonData.containsKey('loginfail') ||
            jsonData.containsKey('msg')) {
          log("Login failed: ${jsonData['msg'] ?? 'Unknown error'}");
          return null;
        }

        // Success
        final user = Signin.fromJson(jsonData);
        log("Login successful. Token: ${user.token}");
        log("User details: ${user.userDetails}");
        return user;
      } else {
        log("Server error: ${response.statusCode}");
        return null;
      }
    } on DioException catch (e) {
      log('DioError: $e');

      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        log("No internet connection");
        return null;
      }

      return null;
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }
}
