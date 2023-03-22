import 'package:alfaisal_for_advertising/common/core_data_source/failure.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/network_info.dart';
import 'package:alfaisal_for_advertising/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:alfaisal_for_advertising/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/core_data_source/helpers.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  FavoriteRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> toggleLike({required int adId}) {
    return FailureHelper<bool>()(() async {
      final result = await remoteDataSource.toggleLike(
        adId: adId,
      );
      return result;
    }, networkInfo);
  }
}
