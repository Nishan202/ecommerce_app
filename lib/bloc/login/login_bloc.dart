import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/bloc/login/login_event.dart';
import 'package:shopping_application/bloc/login/login_state.dart';
import 'package:shopping_application/data/remote/api_helper.dart';

import '../../data/remote/urls.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  ApiHelper apiHelper;
  LoginBloc({required this.apiHelper}) : super(LoginInitialState()){
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoadingState());

      try{
        dynamic res = await apiHelper.postApi(url: Urls.LOGIN_USER_URL, bodyParams: {
          "email": event.email,
          "password": event.password
        });
        if(res['status']){
          emit(LoginLoadedState(token: res['tokan']));
        } else{
          emit(LoginErrorState(errorMessage: res['message']));
        }
      } catch(e){
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    });
  }
}