// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$forgetPasswordUseCaseHash() =>
    r'ea4ac22ee622ac78f81f9601a19b987f1b67e705';

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

typedef ForgetPasswordUseCaseRef = AutoDisposeFutureProviderRef<int>;

/// See also [forgetPasswordUseCase].
@ProviderFor(forgetPasswordUseCase)
const forgetPasswordUseCaseProvider = ForgetPasswordUseCaseFamily();

/// See also [forgetPasswordUseCase].
class ForgetPasswordUseCaseFamily extends Family<AsyncValue<int>> {
  /// See also [forgetPasswordUseCase].
  const ForgetPasswordUseCaseFamily();

  /// See also [forgetPasswordUseCase].
  ForgetPasswordUseCaseProvider call({
    required String mobile,
  }) {
    return ForgetPasswordUseCaseProvider(
      mobile: mobile,
    );
  }

  @override
  ForgetPasswordUseCaseProvider getProviderOverride(
    covariant ForgetPasswordUseCaseProvider provider,
  ) {
    return call(
      mobile: provider.mobile,
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
  String? get name => r'forgetPasswordUseCaseProvider';
}

/// See also [forgetPasswordUseCase].
class ForgetPasswordUseCaseProvider extends AutoDisposeFutureProvider<int> {
  /// See also [forgetPasswordUseCase].
  ForgetPasswordUseCaseProvider({
    required this.mobile,
  }) : super.internal(
          (ref) => forgetPasswordUseCase(
            ref,
            mobile: mobile,
          ),
          from: forgetPasswordUseCaseProvider,
          name: r'forgetPasswordUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forgetPasswordUseCaseHash,
          dependencies: ForgetPasswordUseCaseFamily._dependencies,
          allTransitiveDependencies:
              ForgetPasswordUseCaseFamily._allTransitiveDependencies,
        );

  final String mobile;

  @override
  bool operator ==(Object other) {
    return other is ForgetPasswordUseCaseProvider && other.mobile == mobile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mobile.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
