import 'dart:developer';
import 'dart:io';

import 'package:amrita_treatment/core/app_constants.dart';
import 'package:amrita_treatment/domain/register%20patient/i_register_patient.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterPatientRepo implements IRegisterPatient {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> registerPatient({
    required String name,
    required String payment,
    required String phone,
    required String address,
    required double totalamount,
    required double disamount,
    required double advamount,
    required double balamount,
    required String datntime,
    required String male,
    required String female,
    required String branch,
    required String treatment,
  }) async {
   
    final patientdata = FormData.fromMap({
      "name": name,
      "excecutive": "jibeesh",
      "payment": payment,
      "phone": phone,
      "address": address,
      "total_amount": totalamount,
      "discount_amount": disamount,
      "advance_amount": advamount,
      "balance_amount": balamount,
      "date_nd_time": datntime,
      "id": "",
      "male": male,
      "female": female,
      "branch": branch,
      "treatments": treatment,
    }, ListFormat.multi);
    try {
      final token = await _secureStorage.read(key: "token");
      if (token == null) {
        log("Token not found. User might not be logged in.");
        return;
      }
      final Response response =
          await Dio(BaseOptions(baseUrl: AppConstants.baseurl)).post(
            "PatientUpdate",
            data: patientdata,

            options: Options(
              contentType: Headers.multipartFormDataContentType,
              validateStatus: (status) => true, // allow all status codes
              headers: {
                "Authorization": "Bearer $token", // <-- Add token here
              },
            ),
          );
      // Log response for debugging, even if it's HTML
      log("Patient registration request sent.");
      log("Response status: ${response.statusCode}");
      log("Response data (HTML): ${response.data}");
    } on DioException catch (e) {
      log('DioError: $e');

      if (e.type == DioExceptionType.connectionError ||
          e.error is SocketException) {
        log("No internet connection");
        return;
      }

      return;
    } catch (e) {
      log('Error: $e');
      return;
    }
  }
}
