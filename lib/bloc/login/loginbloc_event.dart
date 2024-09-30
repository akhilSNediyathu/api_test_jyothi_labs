part of 'loginbloc_bloc.dart';

@immutable
sealed class LoginblocEvent {}
class OnLoginButtonClickEvent extends LoginblocEvent {
  final String email;
  final String password;

  OnLoginButtonClickEvent({required this.email, required this.password});
}
