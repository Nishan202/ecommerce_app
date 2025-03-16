import 'package:flutter/material.dart';
import 'package:shopping_application/ui/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(Icons.menu), Icon(Icons.notification_add)],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 12, left: 7),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Light background color
                borderRadius: BorderRadius.circular(25), // Rounded edges
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search,
                      color: Colors.grey), // Search icon
                  suffixIcon: Container(
                    padding: const EdgeInsets.only(left: 10), // Padding for spacing
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.grey, width: 2.0), // Vertical Divider
                      ),
                    ),
                    child: const Icon(Icons.tune, color: Colors.grey), // Filter icon
                  ), // Filter icon
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0), // Adjust padding
                ),
              ),
            ),
            const SizedBox(height: 200,),
            Container(
              height: 80,
              child: ListView.separated(itemCount: 20, scrollDirection: Axis.horizontal, itemBuilder: (ctx, index){
                return const Column(
                  children: [
                    CircleAvatar(child: FlutterLogo(),),
                    SizedBox(height: 7,),
                    Text('items')
                  ],
                );
              }, separatorBuilder: (BuildContext _, int index) => const SizedBox(width: 7,),),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Special for you'),
                TextButton(onPressed: (){}, child: const Text('see all'))
              ],
            ),
            Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12), itemCount: 10, itemBuilder: (gridCtx, index){
              return ProductCard();
            }))
          ],
        ),
      ),
    );
  }
}
