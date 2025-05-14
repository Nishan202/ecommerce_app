import 'package:flutter/material.dart';
import 'package:shopping_application/ui/screens/cart_screen.dart';
import 'package:shopping_application/ui/screens/home_screen.dart';
import 'package:shopping_application/ui/screens/profile_screen.dart';
import 'package:shopping_application/ui/screens/whishlist_screen.dart';

class DashboardNavigationScreen extends StatefulWidget {
  const DashboardNavigationScreen({super.key});

  @override
  State<DashboardNavigationScreen> createState() => _DashboardNavigationScreenState();
}

class _DashboardNavigationScreenState extends State<DashboardNavigationScreen> {
  int selectedIndex = 0;
  List<Widget> mNavScreens = [
    const HomeScreen(),
    const WhishlistScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // for visible background things of floating action button
      body: mNavScreens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              selectedIndex = 0;
              setState(() {

              });
            }, icon: Icon(Icons.home_outlined)),
            IconButton(onPressed: (){
              selectedIndex = 1;
              setState(() {

              });
            }, icon: Icon(Icons.favorite_border)),
            SizedBox(width: 5,),
            SizedBox(width: 5,),
            IconButton(onPressed: (){
              selectedIndex = 2;
              setState(() {

              });
            }, icon: Icon(Icons.shopping_cart_outlined)),
            IconButton(onPressed: (){
              selectedIndex = 3;
              setState(() {

              });
            }, icon: Icon(Icons.account_circle_outlined))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)), backgroundColor: Colors.orange, foregroundColor: Colors.white, onPressed: (){}, child: Icon(Icons.menu),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // for move the floating action button in middle aligned
    );
  }
}
