import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/app_exceptions.dart';
import 'package:shopping_application/bloc/login/login_event.dart';
import 'package:shopping_application/bloc/login/login_state.dart';
import 'package:shopping_application/data/repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(LoginInitialState()){
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoadingState());

      try{
        dynamic res = await userRepository.authenticateUser(email: event.email, password: event.password);
        if(res['status']){
          emit(LoginLoadedState(token: res['tokan']));
        } else{
          emit(LoginErrorState(errorMessage: res['message']));
        }
      } catch(e){
        emit(LoginErrorState(errorMessage: (e as AppExceptions).toString()));
      }
    });
  }
}