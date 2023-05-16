import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/features/authentication/domain/repositories/auth_repository.dart';

part 'remove_account_use_case.g.dart';

@riverpod
Future<String> removeAccountUseCase(RemoveAccountUseCaseRef ref,
    {required String password}) {
  return ref.read(authRepositoryProvider).removeAccount(
        password: password,
      );
}
