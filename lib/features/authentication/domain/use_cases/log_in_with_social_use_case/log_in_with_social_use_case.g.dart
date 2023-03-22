// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_with_social_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logInWithSocialUseCaseHash() =>
    r'998f1abff81680bd2aebbd2087b5094b77964de2';

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

typedef LogInWithSocialUseCaseRef
    = AutoDisposeFutureProviderRef<Either<Failure, User>>;

/// See also [logInWithSocialUseCase].
@ProviderFor(logInWithSocialUseCase)
const logInWithSocialUseCaseProvider = LogInWithSocialUseCaseFamily();

/// See also [logInWithSocialUseCase].
class LogInWithSocialUseCaseFamily
    extends Family<AsyncValue<Either<Failure, User>>> {
  /// See also [logInWithSocialUseCase].
  const LogInWithSocialUseCaseFamily();

  /// See also [logInWithSocialUseCase].
  LogInWithSocialUseCaseProvider call({
    required String userName,
    required String phone,
    required String email,
    required String password,
    required int countryId,
  }) {
    return LogInWithSocialUseCaseProvider(
      userName: userName,
      phone: phone,
      email: email,
      password: password,
      countryId: countryId,
    );
  }

  @override
  LogInWithSocialUseCaseProvider getProviderOverride(
    covariant LogInWithSocialUseCaseProvider provider,
  ) {
    return call(
      userName: provider.userName,
      phone: provider.phone,
      email: provider.email,
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
  String? get name => r'logInWithSocialUseCaseProvider';
}

/// See also [logInWithSocialUseCase].
class LogInWithSocialUseCaseProvider
    extends AutoDisposeFutureProvider<Either<Failure, User>> {
  /// See also [logInWithSocialUseCase].
  LogInWithSocialUseCaseProvider({
    required this.userName,
    required this.phone,
    required this.email,
    required this.password,
    required this.countryId,
  }) : super.internal(
          (ref) => logInWithSocialUseCase(
            ref,
            userName: userName,
            phone: phone,
            email: email,
            password: password,
            countryId: countryId,
          ),
          from: logInWithSocialUseCaseProvider,
          name: r'logInWithSocialUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$logInWithSocialUseCaseHash,
          dependencies: LogInWithSocialUseCaseFamily._dependencies,
          allTransitiveDependencies:
              LogInWithSocialUseCaseFamily._allTransitiveDependencies,
        );

  final String userName;
  final String phone;
  final String email;
  final String password;
  final int countryId;

  @override
  bool operator ==(Object other) {
    return other is LogInWithSocialUseCaseProvider &&
        other.userName == userName &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.countryId == countryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, countryId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
