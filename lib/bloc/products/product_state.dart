import 'package:shopping_application/data/model/product_data_model.dart';

abstract class ProductState{}

class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductErrorState extends ProductState{
  String errorMessage;
  ProductErrorState({required this.errorMessage});
}
class ProductLoadedState extends ProductState{
  List<ProductModel> products;
  ProductLoadedState({required this.products});
}