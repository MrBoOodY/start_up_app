import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_helper.dart';

abstract class OnBoardingLocalDataSource {}

class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  final HiveHelper hiveHelper;
  OnBoardingLocalDataSourceImpl({required this.hiveHelper});
}
