import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/app_exceptions.dart';
import 'package:shopping_application/bloc/signup/register_event.dart';
import 'package:shopping_application/bloc/signup/register_state.dart';
import 'package:shopping_application/data/remote/api_helper.dart';
import 'package:shopping_application/data/remote/urls.dart';
import 'package:shopping_application/data/repository/user_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  UserRepository userRepository;
  RegisterBloc({required this.userRepository}) : super(RegisterInitialState()){
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoadingState());

      try{
        dynamic res = await userRepository.registerUser(name: event.name, phoneNo: event.phoneNo, email: event.email, password: event.password);
        if(res['status']){
          emit(RegisterLoadedState());
        } else{
          emit(RegisterErrorState(errorMessage: res['message']));
        }
      } catch(e){
        emit(RegisterErrorState(errorMessage: (e as AppExceptions).toString()));
      }
    });
  }
}