part of 'loginbloc_bloc.dart';

@immutable
sealed class LoginblocState {}

final class LoginblocInitial extends LoginblocState {}

final class LoginblocLoading extends LoginblocState {}

final class LoginblockSuccesState extends LoginblocState {
  
}

final class LoginBlocErrorState extends LoginblocState {}
