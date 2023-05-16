// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInUseCaseHash() => r'fa114321ef741b240777aa95ce210984a20785f3';

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

typedef SignInUseCaseRef = AutoDisposeFutureProviderRef<void>;

/// See also [signInUseCase].
@ProviderFor(signInUseCase)
const signInUseCaseProvider = SignInUseCaseFamily();

/// See also [signInUseCase].
class SignInUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [signInUseCase].
  const SignInUseCaseFamily();

  /// See also [signInUseCase].
  SignInUseCaseProvider call({
    required String emailAddress,
    required String password,
    required int countryId,
  }) {
    return SignInUseCaseProvider(
      emailAddress: emailAddress,
      password: password,
      countryId: countryId,
    );
  }

  @override
  SignInUseCaseProvider getProviderOverride(
    covariant SignInUseCaseProvider provider,
  ) {
    return call(
      emailAddress: provider.emailAddress,
      password: provider.password,
      countryId: provider.countryId,
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
  String? get name => r'signInUseCaseProvider';
}

/// See also [signInUseCase].
class SignInUseCaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signInUseCase].
  SignInUseCaseProvider({
    required this.emailAddress,
    required this.password,
    required this.countryId,
  }) : super.internal(
          (ref) => signInUseCase(
            ref,
            emailAddress: emailAddress,
            password: password,
            countryId: countryId,
          ),
          from: signInUseCaseProvider,
          name: r'signInUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInUseCaseHash,
          dependencies: SignInUseCaseFamily._dependencies,
          allTransitiveDependencies:
              SignInUseCaseFamily._allTransitiveDependencies,
        );

  final String emailAddress;
  final String password;
  final int countryId;

  @override
  bool operator ==(Object other) {
    return other is SignInUseCaseProvider &&
        other.emailAddress == emailAddress &&
        other.password == password &&
        other.countryId == countryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, emailAddress.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, countryId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
