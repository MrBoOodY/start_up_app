import 'package:alfaisal_for_advertising/common/core_data_source/dio_helper/dio_helper.dart';

abstract class OnBoardingRemoteDataSource {}

class OnBoardingRemoteDataSourceImpl implements OnBoardingRemoteDataSource {
  final DioHelper dio;
  OnBoardingRemoteDataSourceImpl({required this.dio});
}
