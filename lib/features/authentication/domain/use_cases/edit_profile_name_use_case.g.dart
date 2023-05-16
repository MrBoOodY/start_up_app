// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_name_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editProfileNameUseCaseHash() =>
    r'eba7bd739e74e9b10929350b1eac6770589d2f61';

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

typedef EditProfileNameUseCaseRef = AutoDisposeFutureProviderRef<String>;

/// See also [editProfileNameUseCase].
@ProviderFor(editProfileNameUseCase)
const editProfileNameUseCaseProvider = EditProfileNameUseCaseFamily();

/// See also [editProfileNameUseCase].
class EditProfileNameUseCaseFamily extends Family<AsyncValue<String>> {
  /// See also [editProfileNameUseCase].
  const EditProfileNameUseCaseFamily();

  /// See also [editProfileNameUseCase].
  EditProfileNameUseCaseProvider call({
    required String userName,
  }) {
    return EditProfileNameUseCaseProvider(
      userName: userName,
    );
  }

  @override
  EditProfileNameUseCaseProvider getProviderOverride(
    covariant EditProfileNameUseCaseProvider provider,
  ) {
    return call(
      userName: provider.userName,
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
  String? get name => r'editProfileNameUseCaseProvider';
}

/// See also [editProfileNameUseCase].
class EditProfileNameUseCaseProvider extends AutoDisposeFutureProvider<String> {
  /// See also [editProfileNameUseCase].
  EditProfileNameUseCaseProvider({
    required this.userName,
  }) : super.internal(
          (ref) => editProfileNameUseCase(
            ref,
            userName: userName,
          ),
          from: editProfileNameUseCaseProvider,
          name: r'editProfileNameUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editProfileNameUseCaseHash,
          dependencies: EditProfileNameUseCaseFamily._dependencies,
          allTransitiveDependencies:
              EditProfileNameUseCaseFamily._allTransitiveDependencies,
        );

  final String userName;

  @override
  bool operator ==(Object other) {
    return other is EditProfileNameUseCaseProvider &&
        other.userName == userName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
