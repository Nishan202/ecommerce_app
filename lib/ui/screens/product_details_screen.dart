import 'package:flutter/material.dart';
import '../../data/model/product_data_model.dart';
import '../../data/remote/api_helper.dart';
import '../../data/remote/urls.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel selectedProduct;
  const ProductDetailsScreen({super.key, required this.selectedProduct});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  int selectedOpt = 1;
  int qty = 1;
  ApiHelper? apiHelper;

  @override
  void initState() {
    super.initState();
    apiHelper = ApiHelper();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex: 2, child: Center(child: Image.network(widget.selectedProduct.image!,width: 300,
            height: 300,))),
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(11),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 16,
                          spreadRadius: 2,
                          color: Colors.black45,
                          offset: Offset(0, 7))
                    ],
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.selectedProduct.name!,
                      style:
                      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${widget.selectedProduct.price}',
                      style:
                      const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Seller: Tariqul Islam',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.right,
                        )),
                    Row(
                      children: [
                        getMyContainer(
                            mWidget: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '4.8',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            mWidth: 50),
                        const Text(
                          '  320 Reviews',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    const Text(
                      'Color',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: Colors.orange, width: 1)),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.orange),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            selectedOpt = 1;
                            setState((){

                            });
                          },
                          child: selectedOpt == 1
                              ? InkWell(
                            onTap: () {
                              selectedOpt = 1;
                              setState(() {

                              });
                            },
                            child: getMyContainer(
                                mPadding: 8,
                                mHeight: 40,
                                mWidget: const Center(
                                  child: Text(
                                    "Descriptiion",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          )
                              : const Text(
                            "Descriptiion",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedOpt = 2;
                            setState(() {

                            });
                          },
                          child: selectedOpt == 2 ?
                          getMyContainer(
                              mPadding: 8,
                              mHeight: 40,
                              mWidget: const Center(
                                child: Text(
                                  "Specifications",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                              : const Text(
                            "Specifications",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedOpt = 3;
                            setState(() {

                            });
                          },
                          child: selectedOpt == 3
                              ? getMyContainer(
                              mPadding: 8,
                              mHeight: 40,
                              mWidget: const Center(
                                child: Text(
                                  "Reviews",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                              : const Text(
                            "Reviews",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: Text("This is Description..")),
                    Container(
                      height: 70,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove,  color: Colors.white),
                                  onPressed: () {
                                    if(qty>1){
                                      qty--;
                                      setState(() {

                                      });
                                    }
                                  },
                                ),
                                Text("$qty", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                                IconButton(
                                  icon: const Icon(Icons.add,  color: Colors.white),
                                  onPressed: () {
                                    qty++;
                                    setState(() {

                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            ),
                            onPressed: () async{

                              try{
                                dynamic mRes = await apiHelper!.postApi(url: Urls.ADD_TO_CART_URL, bodyParams: {
                                  "product_id":widget.selectedProduct.id,
                                  "quantity": qty
                                });

                                if(mRes["status"]){
                                  // print("Added to cart");
                                  Get.snackbar("Success", "Added to cart", colorText: Colors.white, backgroundColor: Colors.greenAccent, snackPosition: SnackPosition.TOP);
                                } else {
                                  // print("Something went wrong!!");
                                  Get.snackbar("Error", "Something went wrong!", colorText: Colors.white, backgroundColor: Colors.redAccent, snackPosition: SnackPosition.TOP);
                                }

                              } catch(e){
                                // print("Error: $e");
                                Get.snackbar("Error", e.toString(), colorText: Colors.white, backgroundColor: Colors.redAccent, snackPosition: SnackPosition.TOP);
                              }

                            },
                            child: const Text("Add to Cart", style: TextStyle(fontSize: 18, color: Colors.white)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget getMyContainer(
      {double? mWidth,
        double? mHeight,
        required Widget mWidget,
        double mPadding = 2}) {
    return Container(
      padding: EdgeInsets.only(
          left: mPadding * 2,
          right: mPadding * 2,
          top: mPadding,
          bottom: mPadding),
      width: mWidth,
      height: mHeight,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(100)),
      child: mWidget,
    );
  }
}
