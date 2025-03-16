import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/bloc/signup/register_event.dart';
import 'package:shopping_application/bloc/signup/register_state.dart';
import 'package:shopping_application/data/remote/api_helper.dart';
import 'package:shopping_application/data/remote/urls.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  ApiHelper apiHelper;
  RegisterBloc({required this.apiHelper}) : super(RegisterInitialState()){
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoadingState());

      try{
        dynamic res = await apiHelper.postApi(url: Urls.REGISTER_USER_URL, bodyParams: {
          "name": event.name,
          "mobile_number": event.phoneNo,
          "email": event.email,
          "password": event.password
        });
        if(res['status']){
          emit(RegisterLoadedState());
        } else{
          emit(RegisterErrorState(errorMessage: res['message']));
        }
      } catch(e){
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    });
  }
}