import 'package:dio/dio.dart';
import 'package:fluxstore/core/errors/exception.dart';
import 'package:fluxstore/feature/auth/data/models/login_model.dart';
import 'package:fluxstore/feature/auth/data/models/signup_request.dart';

abstract class AuthRemoteDatasource {
  Future<String> signup(UserSignupRequestModel user);
  Future<String> login(UserLoginRequestModel user);
  Future<String> forgotPassword(String email);
  Future<String> verifyOTP(String email, String otp);
  Future<String> resetPassword(String email, String password);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;
  AuthRemoteDatasourceImpl({required this.dio});
  @override
  Future<String> forgotPassword(String email) async {
    try {
      final response = await dio.post(
        '/auth/forgot-password',
        data: {'email': email},
      );
      return response.data['message'] as String;
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 400:
            final data = e.response?.data;
            final rawMessage =
                data is String ? data : data['message'] ?? 'Invalid request';

            final message =
                rawMessage is List
                    ? rawMessage.join(', ')
                    : rawMessage.toString();

            throw BadRequestException(message);
          case 401:
            final message =
                e.response?.data is String
                    ? e.response?.data
                    : e.response?.data['message'];
            throw UnauthorizedException(message);
          case 500:
          default:
            throw ServerException('Something went wrong on the server');
        }
      } else {
        throw ServerException('No response from server');
      }
    }
  }

  @override
  Future<String> login(UserLoginRequestModel user) async {
    try {
      final response = await dio.post('/auth/login', data: user.toJson());
      final message = response.data['data']['message'] as String;
      if (message.isEmpty) {
        throw ServerException('Login failed, no message returned');
      }
      return message;
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 400:
            final data = e.response?.data;
            final rawMessage =
                data is String ? data : data['message'] ?? 'Invalid request';

            final message =
                rawMessage is List
                    ? rawMessage.join(', ')
                    : rawMessage.toString();

            throw BadRequestException(message);
          case 401:
            final message =
                e.response?.data is String
                    ? e.response?.data
                    : e.response?.data['message'];
            throw UnauthorizedException(message);
          case 500:
          default:
            throw ServerException('Something went wrong on the server');
        }
      } else {
        throw ServerException('No response from server');
      }
    }
  }

  @override
  Future<String> resetPassword(String email, String password) async {
    try {
      final response = await dio.patch(
        '/auth/reset-password',
        data: {'email': email, 'password': password},
      );
      return response.data['message'] as String;
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 400:
            final data = e.response?.data;
            final rawMessage =
                data is String ? data : data['message'] ?? 'Invalid request';

            final message =
                rawMessage is List
                    ? rawMessage.join(', ')
                    : rawMessage.toString();

            throw BadRequestException(message);
          case 401:
            final message =
                e.response?.data is String
                    ? e.response?.data
                    : e.response?.data['message'];
            throw UnauthorizedException(message);
          case 500:
          default:
            throw ServerException('Something went wrong on the server');
        }
      } else {
        throw ServerException('No response from server');
      }
    }
  }

  @override
  Future<String> signup(UserSignupRequestModel user) async {
    try {
      final response = await dio.post('/auth/signup', data: user.toJson());
      return response.data['message'] as String;
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 400:
            final data = e.response?.data;
            final rawMessage =
                data is String ? data : data['message'] ?? 'Invalid request';

            final message =
                rawMessage is List
                    ? rawMessage.join(', ')
                    : rawMessage.toString();

            throw BadRequestException(message);
          case 401:
            final message =
                e.response?.data is String
                    ? e.response?.data
                    : e.response?.data['message'];
            throw UnauthorizedException(message);
          case 500:
          default:
            throw ServerException('Something went wrong on the server');
        }
      } else {
        throw ServerException('No response from server');
      }
    }
  }

  @override
  Future<String> verifyOTP(String email, String otp) async {
    try {
      final response = await dio.post(
        '/auth/verify-otp',
        data: {'email': email, 'code': otp},
      );
      return response.data['message'] as String;
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 400:
            final data = e.response?.data;
            final rawMessage =
                data is String ? data : data['message'] ?? 'Invalid request';

            final message =
                rawMessage is List
                    ? rawMessage.join(', ')
                    : rawMessage.toString();

            throw BadRequestException(message);
          case 401:
            final message =
                e.response?.data is String
                    ? e.response?.data
                    : e.response?.data['message'];
            throw UnauthorizedException(message);
          case 500:
          default:
            throw ServerException('Something went wrong on the server');
        }
      } else {
        throw ServerException('No response from server');
      }
    }
  }
}
