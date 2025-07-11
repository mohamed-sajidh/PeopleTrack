import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:peopletrack/core/utils/config.dart';
import 'package:peopletrack/core/utils/storage.dart';

class AuthServices {
  static Future<String?> userLogin(
    String emailId,
    String password,
    BuildContext context,
  ) async {
    try {
      final dio = Dio();

      var data = {
        'email': emailId,
        'password': password,
        "mob_user": 1,
      };

      final loginEndPoint = '${ApiConfig.baseUrl}/api/login';

      final response = await dio.post(
        loginEndPoint,
        data: data,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (response.statusCode == 200) {
        SecureStorageService secureStorageService = SecureStorageService();

        Map<String, dynamic>? data = response.data;

        if (data != null) {
          final String accessToken = data['access_token'];
          print("accessToken -> $accessToken");
          await secureStorageService.storeToken(accessToken);
        }

        return null;
      } else {
        print("response=> ${response.data.toString()}");
        return response.data.toString();
      }
    } on DioException catch (e) {
      print("error => $e");
      Map<String, dynamic>? errorData = e.response?.data;

      if (errorData != null) {
        String? errorMessage = errorData.values.firstWhere(
          (value) => value is String,
          orElse: () => "Unknown error occurred",
        );
        return errorMessage;
      }
      return "Something went wrong. Please try again.";
    } catch (e) {
      return "Unexpected error: $e";
    }
  }
}
