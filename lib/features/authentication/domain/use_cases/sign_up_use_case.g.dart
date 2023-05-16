// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpUseCaseHash() => r'2cd1a5c0e9740d2b5cae95c5aeaa677fb5ddf946';

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

typedef SignUpUseCaseRef = AutoDisposeFutureProviderRef<String>;

/// See also [signUpUseCase].
@ProviderFor(signUpUseCase)
const signUpUseCaseProvider = SignUpUseCaseFamily();

/// See also [signUpUseCase].
class SignUpUseCaseFamily extends Family<AsyncValue<String>> {
  /// See also [signUpUseCase].
  const SignUpUseCaseFamily();

  /// See also [signUpUseCase].
  SignUpUseCaseProvider call({
    required String userName,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required int countryId,
  }) {
    return SignUpUseCaseProvider(
      userName: userName,
      phone: phone,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      countryId: countryId,
    );
  }

  @override
  SignUpUseCaseProvider getProviderOverride(
    covariant SignUpUseCaseProvider provider,
  ) {
    return call(
      userName: provider.userName,
      phone: provider.phone,
      email: provider.email,
      password: provider.password,
      confirmPassword: provider.confirmPassword,
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
  String? get name => r'signUpUseCaseProvider';
}

/// See also [signUpUseCase].
class SignUpUseCaseProvider extends AutoDisposeFutureProvider<String> {
  /// See also [signUpUseCase].
  SignUpUseCaseProvider({
    required this.userName,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.countryId,
  }) : super.internal(
          (ref) => signUpUseCase(
            ref,
            userName: userName,
            phone: phone,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            countryId: countryId,
          ),
          from: signUpUseCaseProvider,
          name: r'signUpUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpUseCaseHash,
          dependencies: SignUpUseCaseFamily._dependencies,
          allTransitiveDependencies:
              SignUpUseCaseFamily._allTransitiveDependencies,
        );

  final String userName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final int countryId;

  @override
  bool operator ==(Object other) {
    return other is SignUpUseCaseProvider &&
        other.userName == userName &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword &&
        other.countryId == countryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, confirmPassword.hashCode);
    hash = _SystemHash.combine(hash, countryId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
