import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../data/model/cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<CartModel> cartItems = [
    /* {
        'name': 'Woman Sweater',
        'category': 'Woman Fashion',
        'price': 70.00,
        'image': 'assets/images/sweater.png', // Replace with your image
        'quantity': 1,
      },
      {
        'name': 'Smart Watch',
        'category': 'Electronics',
        'price': 55.00,
        'image': 'assets/images/watch.png', // Replace with your image
        'quantity': 1,
      },
      {
        'name': 'Wireless Headphone',
        'category': 'Electronics',
        'price': 120.00,
        'image': 'assets/images/headphone.png', // Replace with your image
        'quantity': 1,
      },*/
  ];

  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(FetchAllCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if(state is CartLoadingState){
              return const Center(child: CircularProgressIndicator());
            }

            if(state is CartErrorState){
              return Center(child: Text(state.errorMsg),);
            }

            if(state is CartLoadedState){

              cartItems = state.cartItems;

              double subtotal = 0.0;
              for (var item in cartItems) {
                subtotal += double.parse(item.price!) * item.quantity!;
              }
              double total = subtotal; // Adjust if you have taxes/shipping
              return Stack(
                children: [
                  // CART ITEMS
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            // Product Image
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.network(item.image!, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 12),
                            // Product Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.productId.toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '\$${item.price!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Quantity & Trash Icon
                            Column(
                              children: [
                                // Trash Icon
                                IconButton(
                                  onPressed: () {
                                    // TODO: Handle remove item
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.orange,
                                  ),
                                ),
                                // Quantity Row
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // TODO: Handle decrease quantity
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text('${item.quantity}'),
                                    IconButton(
                                      onPressed: () {
                                        // TODO: Handle increase quantity
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  // DISCOUNT CODE SECTION
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(11),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            margin: const EdgeInsets.only(top: 4),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Discount Code',
                                      hintStyle: TextStyle(color: Colors.grey.shade400),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO: Handle apply discount
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Apply'),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // SUBTOTAL & TOTAL
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Subtotal',
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '\$${subtotal.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$${total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // CHECKOUT BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: Handle checkout
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Checkout', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
