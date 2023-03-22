import 'package:alfaisal_for_advertising/common/constants/urls.dart';

import '../../../../common/core_data_source/dio_helper/dio_helper.dart';

abstract class FavoriteRemoteDataSource {
  Future<bool> toggleLike({required int adId});
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final DioHelper dio;
  FavoriteRemoteDataSourceImpl({required this.dio});

  @override
  Future<bool> toggleLike({required int adId}) async {
    try {
      final response =
          await dio.doPatchRequest(url: '${Urls.toggleLike}/$adId');
      return response['data']['is_liked']?.toString() == '1';
    } catch (error) {
      rethrow;
    }
  }
}
