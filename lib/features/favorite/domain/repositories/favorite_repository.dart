import 'package:dartz/dartz.dart';

import '../../../../common/core_data_source/failure.dart';

abstract class FavoriteRepository {
  /// to toggle Like one ad using its id
  Future<Either<Failure, bool>> toggleLike({required int adId});
}
