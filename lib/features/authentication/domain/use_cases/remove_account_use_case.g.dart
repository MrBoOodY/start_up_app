// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_account_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$removeAccountUseCaseHash() =>
    r'c0ffa6c7bb2316f625ccc65539dd65fe0b90d011';

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

typedef RemoveAccountUseCaseRef = AutoDisposeFutureProviderRef<String>;

/// See also [removeAccountUseCase].
@ProviderFor(removeAccountUseCase)
const removeAccountUseCaseProvider = RemoveAccountUseCaseFamily();

/// See also [removeAccountUseCase].
class RemoveAccountUseCaseFamily extends Family<AsyncValue<String>> {
  /// See also [removeAccountUseCase].
  const RemoveAccountUseCaseFamily();

  /// See also [removeAccountUseCase].
  RemoveAccountUseCaseProvider call({
    required String password,
  }) {
    return RemoveAccountUseCaseProvider(
      password: password,
    );
  }

  @override
  RemoveAccountUseCaseProvider getProviderOverride(
    covariant RemoveAccountUseCaseProvider provider,
  ) {
    return call(
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
  String? get name => r'removeAccountUseCaseProvider';
}

/// See also [removeAccountUseCase].
class RemoveAccountUseCaseProvider extends AutoDisposeFutureProvider<String> {
  /// See also [removeAccountUseCase].
  RemoveAccountUseCaseProvider({
    required this.password,
  }) : super.internal(
          (ref) => removeAccountUseCase(
            ref,
            password: password,
          ),
          from: removeAccountUseCaseProvider,
          name: r'removeAccountUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeAccountUseCaseHash,
          dependencies: RemoveAccountUseCaseFamily._dependencies,
          allTransitiveDependencies:
              RemoveAccountUseCaseFamily._allTransitiveDependencies,
        );

  final String password;

  @override
  bool operator ==(Object other) {
    return other is RemoveAccountUseCaseProvider && other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
