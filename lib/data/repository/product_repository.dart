import '../remote/api_helper.dart';
import '../remote/urls.dart';

class ProductRepository{
  ApiHelper apiHelper;
  ProductRepository({required this.apiHelper});
  Future<dynamic> getAllProducts() async {
    try{
      return await apiHelper.postApi(url: Urls.PRODUCT_URL);
    } catch(e){
      rethrow;
    }
  }
}