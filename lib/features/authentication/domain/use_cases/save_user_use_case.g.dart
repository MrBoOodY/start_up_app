// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_user_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveUserUseCaseHash() => r'34a55c410bbb375a55b9c4c949b9ec3c070ea322';

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

typedef SaveUserUseCaseRef = AutoDisposeFutureProviderRef<void>;

/// See also [saveUserUseCase].
@ProviderFor(saveUserUseCase)
const saveUserUseCaseProvider = SaveUserUseCaseFamily();

/// See also [saveUserUseCase].
class SaveUserUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [saveUserUseCase].
  const SaveUserUseCaseFamily();

  /// See also [saveUserUseCase].
  SaveUserUseCaseProvider call({
    required User user,
  }) {
    return SaveUserUseCaseProvider(
      user: user,
    );
  }

  @override
  SaveUserUseCaseProvider getProviderOverride(
    covariant SaveUserUseCaseProvider provider,
  ) {
    return call(
      user: provider.user,
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
  String? get name => r'saveUserUseCaseProvider';
}

/// See also [saveUserUseCase].
class SaveUserUseCaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [saveUserUseCase].
  SaveUserUseCaseProvider({
    required this.user,
  }) : super.internal(
          (ref) => saveUserUseCase(
            ref,
            user: user,
          ),
          from: saveUserUseCaseProvider,
          name: r'saveUserUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveUserUseCaseHash,
          dependencies: SaveUserUseCaseFamily._dependencies,
          allTransitiveDependencies:
              SaveUserUseCaseFamily._allTransitiveDependencies,
        );

  final User user;

  @override
  bool operator ==(Object other) {
    return other is SaveUserUseCaseProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
