part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoadingState extends CartState {}
final class CartLoadedState extends CartState {
  List<CartModel> cartItems;
  CartLoadedState({required this.cartItems});
}
final class CartErrorState extends CartState {
  String errorMsg;
  CartErrorState({required this.errorMsg});
}
