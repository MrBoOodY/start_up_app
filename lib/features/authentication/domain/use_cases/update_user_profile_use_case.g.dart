// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_profile_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateUserProfileUseCaseHash() =>
    r'472206a24dfa25edcb9b204f2990d210fd85b3c3';

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

typedef UpdateUserProfileUseCaseRef = AutoDisposeFutureProviderRef<String>;

/// See also [updateUserProfileUseCase].
@ProviderFor(updateUserProfileUseCase)
const updateUserProfileUseCaseProvider = UpdateUserProfileUseCaseFamily();

/// See also [updateUserProfileUseCase].
class UpdateUserProfileUseCaseFamily extends Family<AsyncValue<String>> {
  /// See also [updateUserProfileUseCase].
  const UpdateUserProfileUseCaseFamily();

  /// See also [updateUserProfileUseCase].
  UpdateUserProfileUseCaseProvider call({
    required String userName,
    required String phone,
    required String email,
    String? image,
    String? password,
    required int countryId,
    required int? cityId,
    required int? areaId,
  }) {
    return UpdateUserProfileUseCaseProvider(
      userName: userName,
      phone: phone,
      email: email,
      image: image,
      password: password,
      countryId: countryId,
      cityId: cityId,
      areaId: areaId,
    );
  }

  @override
  UpdateUserProfileUseCaseProvider getProviderOverride(
    covariant UpdateUserProfileUseCaseProvider provider,
  ) {
    return call(
      userName: provider.userName,
      phone: provider.phone,
      email: provider.email,
      image: provider.image,
      password: provider.password,
      countryId: provider.countryId,
      cityId: provider.cityId,
      areaId: provider.areaId,
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
  String? get name => r'updateUserProfileUseCaseProvider';
}

/// See also [updateUserProfileUseCase].
class UpdateUserProfileUseCaseProvider
    extends AutoDisposeFutureProvider<String> {
  /// See also [updateUserProfileUseCase].
  UpdateUserProfileUseCaseProvider({
    required this.userName,
    required this.phone,
    required this.email,
    this.image,
    this.password,
    required this.countryId,
    required this.cityId,
    required this.areaId,
  }) : super.internal(
          (ref) => updateUserProfileUseCase(
            ref,
            userName: userName,
            phone: phone,
            email: email,
            image: image,
            password: password,
            countryId: countryId,
            cityId: cityId,
            areaId: areaId,
          ),
          from: updateUserProfileUseCaseProvider,
          name: r'updateUserProfileUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateUserProfileUseCaseHash,
          dependencies: UpdateUserProfileUseCaseFamily._dependencies,
          allTransitiveDependencies:
              UpdateUserProfileUseCaseFamily._allTransitiveDependencies,
        );

  final String userName;
  final String phone;
  final String email;
  final String? image;
  final String? password;
  final int countryId;
  final int? cityId;
  final int? areaId;

  @override
  bool operator ==(Object other) {
    return other is UpdateUserProfileUseCaseProvider &&
        other.userName == userName &&
        other.phone == phone &&
        other.email == email &&
        other.image == image &&
        other.password == password &&
        other.countryId == countryId &&
        other.cityId == cityId &&
        other.areaId == areaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, countryId.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);
    hash = _SystemHash.combine(hash, areaId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
