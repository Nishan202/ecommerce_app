abstract class LoginState {}

class LoginInitialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginLoadedState extends LoginState{
  String token;
  LoginLoadedState({required this.token});
}
class LoginErrorState extends LoginState{
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}