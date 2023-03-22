import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/dio_helper/dio_helper.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_helper.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/network_info.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:alfaisal_for_advertising/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/repositories/auth_repository.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/use_cases/get_current_user_use_case.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/use_cases/is_logged_in_use_case.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/use_cases/log_out_use_case.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/use_cases/sign_in_use_case.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/use_cases/sign_up_use_case.dart';
import 'package:alfaisal_for_advertising/features/authentication/domain/use_cases/update_user_profile_use_case.dart';
import 'package:alfaisal_for_advertising/features/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:alfaisal_for_advertising/features/on_boarding/data/data_sources/on_boarding_remote_data_source.dart';
import 'package:alfaisal_for_advertising/features/on_boarding/data/repositories/on_boarding_repository_impl.dart';
import 'package:alfaisal_for_advertising/features/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/favorite/data/datasources/favorite_remote_data_source.dart';
import '../features/favorite/data/repositories/favorite_repository_impl.dart';
import '../features/favorite/domain/repositories/favorite_repository.dart';

part 'injection.g.dart';

// external
final logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

@riverpod
FlutterSecureStorage flutterSecureStorage(FlutterSecureStorageRef ref) =>
    const FlutterSecureStorage();
@riverpod
InternetConnectionCheckerPlus internetConnectionChecker(
        InternetConnectionCheckerRef ref) =>
    InternetConnectionCheckerPlus();

//end external

/*
 *
 * 
 use cases
 *
 *
*/

/*
 Auth use cases
*/
@riverpod
GetCurrentUserUseCase getCurrentUserUseCase(GetCurrentUserUseCaseRef ref) =>
    GetCurrentUserUseCase(ref.read(authRepositoryProvider));

@riverpod
SignInUseCase signInUserUseCase(SignInUserUseCaseRef ref) =>
    SignInUseCase(ref.read(authRepositoryProvider));

@riverpod
SignUpUseCase signUpUserUseCase(SignUpUserUseCaseRef ref) =>
    SignUpUseCase(ref.read(authRepositoryProvider));
@riverpod
IsLoggedInUseCase isLoggedInUseCase(IsLoggedInUseCaseRef ref) =>
    IsLoggedInUseCase(ref.read(authRepositoryProvider));

@riverpod
UpdateUserProfileUseCase updateUserProfileUseCase(
        UpdateUserProfileUseCaseRef ref) =>
    UpdateUserProfileUseCase(ref.read(authRepositoryProvider));
@riverpod
LogOutUseCase logOutUseCase(LogOutUseCaseRef ref) =>
    LogOutUseCase(ref.read(authRepositoryProvider));

/*
 On Boarding use cases
*/

/*
 *
 * 
 end use cases
 *
 * 
*/

// repository
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepositoryImpl(
      localDataSource: ref.read(authLocalDataSourceProvider),
      remoteDataSource: ref.read(authRemoteDataSourceProvider),
      networkInfo: ref.read(networkInfoProvider),
    );
@riverpod
NetworkInfo networkInfo(NetworkInfoRef ref) => NetworkInfoImpl(
      internetConnectionChecker: ref.read(internetConnectionCheckerProvider),
    );

@riverpod
OnBoardingRepository onBoardingRepository(OnBoardingRepositoryRef ref) =>
    OnBoardingRepositoryImpl(
        localDataSource: ref.read(onBoardingLocalDataSourceProvider),
        remoteDataSource: ref.read(
          onBoardingRemoteDataSourceProvider,
        ));
@riverpod
@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) =>
    FavoriteRepositoryImpl(
      remoteDataSource: ref.read(favoriteRemoteDataSourceProvider),
      networkInfo: ref.read(networkInfoProvider),
    );
@riverpod

//end repository

//start remote data source

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) =>
    AuthRemoteDataSourceImpl(
      dio: ref.read(dioHelperProvider),
    );

@riverpod
OnBoardingRemoteDataSource onBoardingRemoteDataSource(
        OnBoardingRemoteDataSourceRef ref) =>
    OnBoardingRemoteDataSourceImpl(
      dio: ref.read(dioHelperProvider),
    );

@riverpod
FavoriteRemoteDataSource favoriteRemoteDataSource(
        FavoriteRemoteDataSourceRef ref) =>
    FavoriteRemoteDataSourceImpl(
      dio: ref.read(dioHelperProvider),
    );

//end remote data source

// start local data source

@riverpod
AuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) =>
    AuthLocalDataSourceImpl(
      flutterSecureStorage: ref.read(flutterSecureStorageProvider),
      hiveHelper: ref.read(hiveHelperProvider.notifier),
    );

@riverpod
OnBoardingLocalDataSource onBoardingLocalDataSource(
        OnBoardingLocalDataSourceRef ref) =>
    OnBoardingLocalDataSourceImpl(
      hiveHelper: ref.read(hiveHelperProvider.notifier),
    );
//end local data source 
