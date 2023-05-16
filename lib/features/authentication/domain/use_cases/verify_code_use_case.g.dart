// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyCodeUseCaseHash() => r'125a0dacdc0b35a5765f6bfbfddcaa6d53bb6732';

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

typedef VerifyCodeUseCaseRef = AutoDisposeFutureProviderRef<void>;

/// See also [verifyCodeUseCase].
@ProviderFor(verifyCodeUseCase)
const verifyCodeUseCaseProvider = VerifyCodeUseCaseFamily();

/// See also [verifyCodeUseCase].
class VerifyCodeUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [verifyCodeUseCase].
  const VerifyCodeUseCaseFamily();

  /// See also [verifyCodeUseCase].
  VerifyCodeUseCaseProvider call({
    required int userId,
    required String code,
  }) {
    return VerifyCodeUseCaseProvider(
      userId: userId,
      code: code,
    );
  }

  @override
  VerifyCodeUseCaseProvider getProviderOverride(
    covariant VerifyCodeUseCaseProvider provider,
  ) {
    return call(
      userId: provider.userId,
      code: provider.code,
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
  String? get name => r'verifyCodeUseCaseProvider';
}

/// See also [verifyCodeUseCase].
class VerifyCodeUseCaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [verifyCodeUseCase].
  VerifyCodeUseCaseProvider({
    required this.userId,
    required this.code,
  }) : super.internal(
          (ref) => verifyCodeUseCase(
            ref,
            userId: userId,
            code: code,
          ),
          from: verifyCodeUseCaseProvider,
          name: r'verifyCodeUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyCodeUseCaseHash,
          dependencies: VerifyCodeUseCaseFamily._dependencies,
          allTransitiveDependencies:
              VerifyCodeUseCaseFamily._allTransitiveDependencies,
        );

  final int userId;
  final String code;

  @override
  bool operator ==(Object other) {
    return other is VerifyCodeUseCaseProvider &&
        other.userId == userId &&
        other.code == code;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
