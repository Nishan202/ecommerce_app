import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/bloc/login/login_bloc.dart';
import 'package:shopping_application/bloc/products/product_bloc.dart';
import 'package:shopping_application/bloc/profile/profile_bloc.dart';
import 'package:shopping_application/bloc/signup/register_bloc.dart';
import 'package:shopping_application/data/remote/api_helper.dart';
import 'package:shopping_application/data/repository/product_repository.dart';
import 'package:shopping_application/data/repository/user_repository.dart';
import 'package:shopping_application/ui/screens/dashboard_navigation_screen.dart';
import 'package:shopping_application/ui/screens/home_screen.dart';
import 'package:shopping_application/ui/screens/splash_screen.dart';

import 'bloc/cart/cart_bloc.dart';

void main() {
  // runApp(BlocProvider(create: (context) => RegisterBloc(apiHelper: ApiHelper()), child: MyApp(),));
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => RegisterBloc(userRepository: UserRepository(apiHelper: ApiHelper()))),
    BlocProvider(create: (context) => LoginBloc(userRepository: UserRepository(apiHelper: ApiHelper()))),
    BlocProvider(create: (context) => ProductBloc(productRepository: ProductRepository(apiHelper: ApiHelper()))),
    BlocProvider(create: (context) => ProfileBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context) => CartBloc(apiHelper: ApiHelper())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}