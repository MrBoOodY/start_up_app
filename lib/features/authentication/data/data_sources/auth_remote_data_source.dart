import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/constants/urls.dart';
import "package:start_up_app/common/core_data_source/dio_helper.dart";
import 'package:start_up_app/common/core_data_source/helpers.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';

part 'auth_remote_data_source.g.dart';

@riverpod
IAuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) =>
    AuthRemoteDataSource(
      dio: ref.read(dioHelperProvider),
    );

abstract class IAuthRemoteDataSource {
  /// sign up new user
  Future<String> signUpUser({
    required String name,
    required String confirmPassword,
    required String phone,
    required String email,
    required String password,
    required int countryId,
  });

  Future<User> signIn({
    required String email,
    required String password,
  });

  /// GET user profile
  Future<User> getUserProfile();

  /// REMOVE ACCOUNT
  Future<String> removeAccount({
    required String password,
  });

  /// UPDATE USER PROFILE
  Future<SuccessResult<User>> updateUserProfile({
    String? name,
    String? phone,
    String? email,
    String? image,
    String? password,
    int? countryId,
    int? cityId,
    int? areaId,
  });

  Future<int> forgetPassword({
    required String mobile,
  });
  Future<void> verifyCode({
    required int userId,
    required String code,
  });
  Future<String> resetPassword({
    required int userId,
    required String password,
  });
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final DioHelper dio;
  AuthRemoteDataSource({required this.dio});

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final User userModel = User(
        email: email,
      );
      final response = await dio.doPostRequest(
          url: Urls.signInUser, data: userModel.toJson());
      final Map<String, dynamic> user = response['data'];

      return User.fromJson(
          user..addAll({'accessToken': response['accessToken']}));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<String> signUpUser({
    required String name,
    required String confirmPassword,
    required String phone,
    required String email,
    required String password,
    required int countryId,
  }) async {
    try {
      final User userModel = User(
        email: email,
        name: name,
        countryId: countryId,
        phone: phone,
      );

      final response = await dio.doPostRequest(
          url: Urls.registerUser, data: userModel.toJson());
      return response['data']['ads_free'].toString();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<SuccessResult<User>> updateUserProfile({
    String? name,
    String? phone,
    String? email,
    String? image,
    String? password,
    int? countryId,
    int? cityId,
    int? areaId,
  }) async {
    final User userModel = User(
      name: name,
      email: email,
      phone: phone,
      img: image,
      countryId: countryId,
      cityId: cityId,
      areaId: areaId,
    );

    try {
      final response = await dio.doPostRequest(
        url: Urls.updateUserProfile,
        data: userModel.toJson(),
      );

      return SuccessResult(
          message: response['message'],
          result: User.fromJson(response['data']));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<int> forgetPassword({
    required String mobile,
  }) async {
    try {
      final response = await dio
          .doPostRequest(url: Urls.forgetPassword, data: {'email': mobile});
      return response['data'];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> verifyCode({
    required int userId,
    required String code,
  }) async {
    try {
      await dio.doPostRequest(
        url: Urls.verifyCode,
        data: {
          'user_id': userId.toString(),
          'code': code,
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<String> resetPassword({
    required int userId,
    required String password,
  }) async {
    try {
      final response = await dio.doPostRequest(
        url: Urls.resetPassword,
        data: {
          'user_id': userId.toString(),
          'password': password,
        },
      );
      return response['message'];
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User> getUserProfile() async {
    try {
      final response = await dio.doPostRequest(url: Urls.getUserProfile);
      return User.fromJson(response['data']);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<String> removeAccount({required String password}) async {
    try {
      final response = await dio.doPostRequest(url: Urls.removeAccount, data: {
        'password': password,
      });
      return response['message'];
    } catch (error) {
      rethrow;
    }
  }
}
