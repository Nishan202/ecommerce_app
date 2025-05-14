import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/cart_model.dart';
import '../../data/remote/api_helper.dart';
import '../../data/remote/urls.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  ApiHelper apiHelper;
  CartBloc({required this.apiHelper}) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      emit(CartLoadingState());

      try{
        dynamic res = await apiHelper.getApi(url: Urls.FETCH_CART_URL);

        if(res['status']){
          emit(CartLoadedState(cartItems: CartDataModel.fromJson(res).data!));
        } else {
          emit(CartErrorState(errorMsg: res['message']));
        }

      } catch(e){
        emit(CartErrorState(errorMsg: e.toString()));
      }

    });
  }
}
