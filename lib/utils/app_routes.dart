import 'package:flutter/material.dart';
import 'package:shopping_application/data/model/product_data_model.dart';
import 'package:shopping_application/ui/screens/cart_screen.dart';
import 'package:shopping_application/ui/screens/dashboard_navigation_screen.dart';
import 'package:shopping_application/ui/screens/product_details_screen.dart';
import 'package:shopping_application/ui/screens/profile_screen.dart';
import 'package:shopping_application/ui/screens/whishlist_screen.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/login_screen.dart';
import '../ui/screens/registration_screen.dart';
import '../ui/screens/splash_screen.dart';

class AppRoutes {
  static const String SPLASH_SCREEN_ROUTE = '/splash';
  static const String BOTTOM_NAVIGATION_BAR = '/';
  static const String HOME_SCREEN_ROUTE = '/home';
  static const String LOGIN_SCREEN_ROUTE = '/login';
  static const String REGISTRATION_SCREEN_ROUTE = '/registration';
  static const String WHISHLIST_SCREEN = '/whishlist';
  static const String PRODUCT_DETAILS_SCREEN = '/product';
  static const String CART_SCREEN = '/cart';
  static const String PROFILE_SCREEN = '/profile';

  static Map<String, WidgetBuilder> pageRoute = {
    SPLASH_SCREEN_ROUTE : (_) => SplashScreen(),
    BOTTOM_NAVIGATION_BAR : (_) => DashboardNavigationScreen(),
    HOME_SCREEN_ROUTE : (_) => HomeScreen(),
    WHISHLIST_SCREEN : (_) => WhishlistScreen(),
    // PRODUCT_DETAILS_SCREEN : (_) => ProductDetailsScreen(selectedProduct: ),
    LOGIN_SCREEN_ROUTE : (_) => LoginScreen(),
    REGISTRATION_SCREEN_ROUTE : (_) => RegistrationScreen(),
    CART_SCREEN : (_) => CartScreen(),
    PROFILE_SCREEN : (_) => ProfileScreen()
  };
}