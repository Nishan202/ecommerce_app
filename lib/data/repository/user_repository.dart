import 'package:shopping_application/data/remote/api_helper.dart';

import '../remote/urls.dart';

class UserRepository{
  ApiHelper apiHelper;
  UserRepository({required this.apiHelper});
  Future<dynamic> authenticateUser({required String email, required String password}) async {
    try{
      return await apiHelper.postApi(url: Urls.LOGIN_USER_URL, bodyParams: {
        "email": email,
        "password": password
      });
    } catch(e){
      rethrow;
    }
  }
  Future<dynamic> registerUser({required String name, required int phoneNo, required String email,required String password}) async {
    try{
      return await apiHelper.postApi(url: Urls.REGISTER_USER_URL, bodyParams: {
        "name": name,
        "mobile_number": phoneNo,
        "email": email,
        "password": password
      });
    } catch (e){
      rethrow;
    }
  }
}