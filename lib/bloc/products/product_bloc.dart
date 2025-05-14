import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/bloc/products/product_event.dart';
import 'package:shopping_application/bloc/products/product_state.dart';
import 'package:shopping_application/data/model/product_data_model.dart';
import 'package:shopping_application/data/repository/product_repository.dart';

import '../../app_exceptions.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
  ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitialState()){
    on<GetAllProductsEvent>((event, emit) async {
      emit(ProductLoadingState());

      try{
        dynamic productsData = await productRepository.getAllProducts();
        // print(productsData);
        if(productsData['status']){
          emit(ProductLoadedState(products: ProductDataModel.fromJson(productsData).data!));
        } else{
          emit(ProductErrorState(errorMessage: productsData['message']));
        }
      } catch(e){
        emit(ProductErrorState(errorMessage: (e as AppExceptions).toString()));
      }
    });
  }

}