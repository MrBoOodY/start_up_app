import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/core_data_source/failure.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_helper.dart';
import 'package:start_up_app/common/core_data_source/sentry_service.dart';
import 'package:start_up_app/common/extensions/object_extension.dart';
import 'package:start_up_app/common/logger.dart';
import 'package:start_up_app/common/utils.dart';

part 'start_up_functionality.g.dart';

@riverpod
Future<void> startUpFunctionality(StartUpFunctionalityRef ref) async {
  try {
    await Future.wait(<Future<dynamic>>[
      ref.read(hiveHelperProvider.future),
      SentryService.init(),
    ]);
  } catch (e) {
    logger.e(e);
  }
}

@riverpod
class MetaDataFunctions extends _$MetaDataFunctions {
  @override
  Future<void> build() async {
    final providers = <AlwaysAliveProviderListenable<AsyncValue<Object?>>>[];

    for (var provider in providers) {
      final providerState = ref.watch(provider);
      if (providerState.isLoading) {
        state = const AsyncLoading();
      } else if (providerState.hasError) {
        if (providerState.error is ConnectionFailure) {
          ref.read(utilsProvider).showNetworkDialog(tryAgainMethod: () {
            ref.invalidate(provider as ProviderOrFamily);

            build();
          });
          return;
        } else {
          providerState.error!.handleExceptions(ref);
        }
      } else {
        state = const AsyncData(null);
      }
    }
  }
}
