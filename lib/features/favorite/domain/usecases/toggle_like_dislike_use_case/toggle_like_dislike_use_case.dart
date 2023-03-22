import 'package:alfaisal_for_advertising/common/utils.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toggle_like_dislike_use_case.g.dart';

@riverpod
Future<bool> toggleLikeDislikeUseCase(
  ToggleLikeDislikeUseCaseRef ref, {
  required int adId,
}) async {
  Utils.showLoading();
  final result =
      await ref.read(favoriteRepositoryProvider).toggleLike(adId: adId);
  Utils.hideLoading();
  return result.fold((failure) {
    Utils.handleFailures(failure);
    throw failure;
  }, (value) {
    return value;
  });
}
