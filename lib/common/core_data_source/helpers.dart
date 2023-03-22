import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/exception.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/network_info.dart';

class FailureHelper<T> {
  FailureHelper();
  Future<Either<Failure, T>> call(
      Future<T> Function() method, NetworkInfo? networkInfo) async {
    if (networkInfo == null || await networkInfo.isConnected) {
      try {
        return Right(await method());
      } on ServerException catch (error) {
        return Left(ServerFailure(message: error.message));
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      } on UnVerifiedException {
        return const Left(UnVerifiedFailure());
      } on DatabaseException {
        return const Left(DatabaseFailure());
      } on SocketException {
        return const Left(ConnectionFailure());
      } catch (error) {
        return Left(ExceptionFailure(message: error.toString()));
      }
    } else {
      return const Left(ConnectionFailure());
    }
  }

  Either<Failure, T> notFutureCall(T Function() method) {
    try {
      return Right(method());
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message));
    } on UnAuthorizedException {
      return const Left(UnAuthorizedFailure());
    } on DatabaseException {
      return const Left(DatabaseFailure());
    } on SocketException {
      return const Left(ConnectionFailure());
    } catch (error) {
      return Left(ExceptionFailure(message: error.toString()));
    }
  }
}

class SuccessResult<T> {
  final String message;
  final T result;

  SuccessResult({required this.message, required this.result});
}
