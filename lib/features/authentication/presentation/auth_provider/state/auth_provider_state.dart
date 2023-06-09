import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:start_up_app/features/authentication/data/models/user/user.dart';

part 'auth_provider_state.freezed.dart';

@freezed
abstract class AuthProviderState with _$AuthProviderState {
  const factory AuthProviderState({
    @Default(false) final bool isLoggedIn,
    final User? currentUser,
  }) = _AuthProviderState;
}
