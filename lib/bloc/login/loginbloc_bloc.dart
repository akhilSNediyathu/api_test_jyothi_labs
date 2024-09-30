
import 'package:api_task/repo/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocState> {
  LoginblocBloc() : super(LoginblocInitial()) {
    on<OnLoginButtonClickEvent>((event, emit) async {
      emit(LoginblocLoading());
      final response =
          await AuthenticationRepo.userLogin(event.email, event.password);
      if (response != null && response.statusCode == 200) {
       
        return emit(LoginblockSuccesState());
      } else {
        return emit(LoginBlocErrorState());
      }
    });
  }
}
