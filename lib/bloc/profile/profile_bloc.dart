import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/bloc/profile/profile_event.dart';
import 'package:shopping_application/bloc/profile/profile_state.dart';
import 'package:shopping_application/data/model/user_data_model.dart';

import '../../data/remote/api_helper.dart';
import '../../data/remote/urls.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ApiHelper apiHelper;
  ProfileBloc({required this.apiHelper}) : super(ProfileInitialState()){
    on<UserProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());

      try{
        dynamic res = await apiHelper.postApi(url: Urls.PROFILE_URL, bodyParams: {});
        if(res['status']){
          var responseData = UserDataModel.fromJson(res);
          emit(ProfileLoadedState(userDataModel: responseData));
        } else{
          emit(ProfileErrorState(errorMessage: res['message']));
        }
      } catch(e){
        emit(ProfileErrorState(errorMessage: e.toString()));
      }
    });
  }
}