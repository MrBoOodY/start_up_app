import 'dart:io';

import 'package:start_up_app/common/core_data_source/exception.dart';
import 'package:start_up_app/common/core_data_source/failure.dart';

class FailureHelper {
  static FailureHelper? _instance;
  FailureHelper._();
  static FailureHelper get instance {
    _instance ??= FailureHelper._();
    return _instance!;
  }

  Future<T> call<T>(Future<T> Function() method) async {
    try {
      return await method();
    } on ServerException catch (error) {
      throw ServerFailure(message: error.message);
    } on UnAuthorizedException {
      throw const UnAuthorizedFailure();
    } on UnVerifiedException {
      throw const UnVerifiedFailure();
    } on DatabaseException {
      throw const DatabaseFailure();
    } on SocketException {
      throw const ConnectionFailure();
    } catch (error) {
      throw ExceptionFailure(message: error.toString());
    }
  }

  T callLocally<T>(T Function() method) {
    try {
      return method();
    } on ServerException catch (error) {
      throw ServerFailure(message: error.message);
    } on UnAuthorizedException {
      throw const UnAuthorizedFailure();
    } on UnVerifiedException {
      throw const UnVerifiedFailure();
    } on DatabaseException {
      throw const DatabaseFailure();
    } catch (error) {
      throw ExceptionFailure(message: error.toString());
    }
  }
}

class SuccessResult<T> {
  final String message;
  final T result;

  SuccessResult({required this.message, required this.result});
}
