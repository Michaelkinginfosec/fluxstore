import 'package:dio/dio.dart';
import 'package:fluxstore/core/errors/exception.dart';
import 'package:fluxstore/feature/auth/data/models/signup_request.dart';
import 'package:fluxstore/feature/auth/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<String> signup(UserSignupRequestModel user);
  Future<UserModel> login(String email, String password);
  Future<String> forgotPassword(String email);
  Future<String> verifyOTP(String email, String otp);
  Future<String> resetPassword(String email, String password);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;
  AuthRemoteDatasourceImpl({required this.dio});
  @override
  Future<String> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> resetPassword(String email, String password) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signup(UserSignupRequestModel user) async {
    try {
      final response = await dio.post('/auth/signup', data: user.toJson());
      return (response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 400:
            final message =
                e.response?.data is String
                    ? e.response?.data
                    : e.response?.data['message'] ?? 'Invalid request';
            throw BadRequestException(message);
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
  Future<String> verifyOTP(String email, String otp) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}
