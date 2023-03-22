import 'package:alfaisal_for_advertising/features/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:alfaisal_for_advertising/features/on_boarding/data/data_sources/on_boarding_remote_data_source.dart';
import 'package:alfaisal_for_advertising/features/on_boarding/domain/repositories/on_boarding_repository.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final OnBoardingRemoteDataSource remoteDataSource;
  final OnBoardingLocalDataSource localDataSource;

  OnBoardingRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});
}
