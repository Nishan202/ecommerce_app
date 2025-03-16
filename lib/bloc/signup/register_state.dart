abstract class RegisterState {}

class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterLoadedState extends RegisterState{}
class RegisterErrorState extends RegisterState{
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}