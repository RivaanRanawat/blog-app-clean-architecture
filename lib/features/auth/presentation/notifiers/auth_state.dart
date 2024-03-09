part of 'auth_notifier.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object?> get props => const <Object?>[];
}

final class AuthSuccess extends AuthState {
  final UserModel user;

  const AuthSuccess(this.user);

  @override
  List<UserModel> get props => <UserModel>[user];
}
