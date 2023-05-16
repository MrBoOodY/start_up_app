import 'package:start_up_app/common/core_data_source/dio_helper.dart';

abstract class OnBoardingRemoteDataSource {}

class OnBoardingRemoteDataSourceImpl implements OnBoardingRemoteDataSource {
  final DioHelper dio;
  OnBoardingRemoteDataSourceImpl({required this.dio});
}
