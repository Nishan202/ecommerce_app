import '../../data/model/user_data_model.dart';

abstract class ProfileState{}

class ProfileInitialState extends ProfileState{}
class ProfileLoadingState extends ProfileState{}
class ProfileErrorState extends ProfileState{
  String errorMessage;
  ProfileErrorState({required this.errorMessage});
}
class ProfileLoadedState extends ProfileState{
  UserDataModel userDataModel;
  ProfileLoadedState({required this.userDataModel});
}