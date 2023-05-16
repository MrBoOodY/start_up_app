import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:start_up_app/common/core_data_source/dio_helper.dart";

part 'on_boarding_local_data_source.g.dart';

@riverpod
IOnBoardingLocalDataSource onBoardingLocalDataSource(
        OnBoardingLocalDataSourceRef ref) =>
    OnBoardingLocalDataSource(
      dio: ref.read(dioHelperProvider),
    );

abstract class IOnBoardingLocalDataSource {}

class OnBoardingLocalDataSource implements IOnBoardingLocalDataSource {
  final DioHelper dio;
  OnBoardingLocalDataSource({required this.dio});
}
