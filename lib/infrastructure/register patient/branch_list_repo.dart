import 'dart:developer';
import 'dart:io';

import 'package:amrita_treatment/core/app_constants.dart';
import 'package:amrita_treatment/domain/register%20patient/branchlist/branchlist.dart';
import 'package:amrita_treatment/domain/register%20patient/i_branchlist.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BranchListRepo implements IBranchlist {
    final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<Branchlist?> getBranchList() async{
    try {
      final token = await _secureStorage.read(key: "token");
      if (token == null) {
        log("Token not found. User might not be logged in.");
        return null;
      }
      final Response response =
          await Dio(BaseOptions(baseUrl: AppConstants.baseurl)).get(
            "BranchList",
            options: Options(
              headers: {
                "Authorization": "Bearer $token", // <-- Add token here
              },
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
        final patientlist = Branchlist.fromJson(jsonData);

        return patientlist;
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
