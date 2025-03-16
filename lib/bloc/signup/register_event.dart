abstract class RegisterEvent{}

class RegisterUserEvent extends RegisterEvent{
  String name;
  int phoneNo;
  String email;
  String password;
  RegisterUserEvent({required this.name, required this.email, required this.password, required this.phoneNo});
}