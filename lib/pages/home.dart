import 'package:flutter/material.dart';
import 'package:start/controllers/home.dart';
import 'package:start/models/bnb.dart';
import 'package:start/pages/main-pages/cart.dart';
import 'package:start/pages/main-pages/favorite.dart';
import 'package:start/pages/main-pages/home.dart';
import 'package:start/pages/main-pages/notifcation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bnbIndex = 0;

  List<BNBIcon> bnbIcons = [
    /*   {'icon': Icons.home_outlined, 'index': 0},
    {'icon': Icons.favorite_outline, 'index': 1},
    {'icon': Icons.shopping_bag_outlined, 'index': 2},
    {'icon': Icons.notifications_outlined, 'index': 3}, */
    BNBIcon(icon: Icons.home_outlined, value: 0),
    BNBIcon(icon: Icons.favorite_outline, value: 1),
    BNBIcon(icon: Icons.shopping_bag_outlined, value: 2),
    BNBIcon(icon: Icons.notifications_outlined, value: 3),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getCategories();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          bnbIndex == 0
              ? BNBHomePage()
              : bnbIndex == 1
              ? favoritePage()
              : bnbIndex == 2
              ? cartPage()
              : notifcationPage(),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < bnbIcons.length; i++)
              bnbIcon(bnbIcons[i].icon, bnbIcons[i].value == bnbIndex, i),
          ],
        ),
      ),
    );
  }

  Widget bnbIcon(IconData icon, bool isActive, int i) {
    return IconButton(
      onPressed: () {
        setState(() {
          bnbIndex = i;
        });
      },
      icon: Icon(
        icon,
        color: isActive ? Color(0xFFc67c4e) : Colors.black38,
        size: 33,
      ),
    );
  }
}
