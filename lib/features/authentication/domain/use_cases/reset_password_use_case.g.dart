// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resetPasswordUseCaseHash() =>
    r'31d1551ecfd5992fd2dcc088b1f6105785239e93';

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

typedef ResetPasswordUseCaseRef = AutoDisposeFutureProviderRef<String>;

/// See also [resetPasswordUseCase].
@ProviderFor(resetPasswordUseCase)
const resetPasswordUseCaseProvider = ResetPasswordUseCaseFamily();

/// See also [resetPasswordUseCase].
class ResetPasswordUseCaseFamily extends Family<AsyncValue<String>> {
  /// See also [resetPasswordUseCase].
  const ResetPasswordUseCaseFamily();

  /// See also [resetPasswordUseCase].
  ResetPasswordUseCaseProvider call({
    required int userId,
    required String password,
  }) {
    return ResetPasswordUseCaseProvider(
      userId: userId,
      password: password,
    );
  }

  @override
  ResetPasswordUseCaseProvider getProviderOverride(
    covariant ResetPasswordUseCaseProvider provider,
  ) {
    return call(
      userId: provider.userId,
      password: provider.password,
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
  String? get name => r'resetPasswordUseCaseProvider';
}

/// See also [resetPasswordUseCase].
class ResetPasswordUseCaseProvider extends AutoDisposeFutureProvider<String> {
  /// See also [resetPasswordUseCase].
  ResetPasswordUseCaseProvider({
    required this.userId,
    required this.password,
  }) : super.internal(
          (ref) => resetPasswordUseCase(
            ref,
            userId: userId,
            password: password,
          ),
          from: resetPasswordUseCaseProvider,
          name: r'resetPasswordUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resetPasswordUseCaseHash,
          dependencies: ResetPasswordUseCaseFamily._dependencies,
          allTransitiveDependencies:
              ResetPasswordUseCaseFamily._allTransitiveDependencies,
        );

  final int userId;
  final String password;

  @override
  bool operator ==(Object other) {
    return other is ResetPasswordUseCaseProvider &&
        other.userId == userId &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
