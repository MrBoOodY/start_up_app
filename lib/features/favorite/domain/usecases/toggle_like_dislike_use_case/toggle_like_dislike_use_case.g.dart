// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_like_dislike_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$toggleLikeDislikeUseCaseHash() =>
    r'f193983724883396fc175eed70e1dfd09c7e700b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ToggleLikeDislikeUseCaseRef = AutoDisposeFutureProviderRef<bool>;

/// See also [toggleLikeDislikeUseCase].
@ProviderFor(toggleLikeDislikeUseCase)
const toggleLikeDislikeUseCaseProvider = ToggleLikeDislikeUseCaseFamily();

/// See also [toggleLikeDislikeUseCase].
class ToggleLikeDislikeUseCaseFamily extends Family<AsyncValue<bool>> {
  /// See also [toggleLikeDislikeUseCase].
  const ToggleLikeDislikeUseCaseFamily();

  /// See also [toggleLikeDislikeUseCase].
  ToggleLikeDislikeUseCaseProvider call({
    required int adId,
  }) {
    return ToggleLikeDislikeUseCaseProvider(
      adId: adId,
    );
  }

  @override
  ToggleLikeDislikeUseCaseProvider getProviderOverride(
    covariant ToggleLikeDislikeUseCaseProvider provider,
  ) {
    return call(
      adId: provider.adId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'toggleLikeDislikeUseCaseProvider';
}

/// See also [toggleLikeDislikeUseCase].
class ToggleLikeDislikeUseCaseProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [toggleLikeDislikeUseCase].
  ToggleLikeDislikeUseCaseProvider({
    required this.adId,
  }) : super.internal(
          (ref) => toggleLikeDislikeUseCase(
            ref,
            adId: adId,
          ),
          from: toggleLikeDislikeUseCaseProvider,
          name: r'toggleLikeDislikeUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$toggleLikeDislikeUseCaseHash,
          dependencies: ToggleLikeDislikeUseCaseFamily._dependencies,
          allTransitiveDependencies:
              ToggleLikeDislikeUseCaseFamily._allTransitiveDependencies,
        );

  final int adId;

  @override
  bool operator ==(Object other) {
    return other is ToggleLikeDislikeUseCaseProvider && other.adId == adId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
