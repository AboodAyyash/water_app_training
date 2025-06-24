import 'package:flutter/material.dart';
import 'package:start/apis/home.dart';
import 'package:start/controllers/home.dart';
import 'package:start/widgets/product.dart';
/* 
Widget cartPage() {
  return cart.isEmpty
      ? Center(child: Text("No Cart Products"))
      : GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (int i = 0; i < cart.length; i++) ProductWidget(product: cart[i]),
        ],
      );
} */

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartURL().then((onValue) {
      print(onValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return cart.isEmpty
        ? Center(child: Text("No Cart Products"))
        : GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (int i = 0; i < cart.length; i++)
              ProductWidget(product: cart[i]),
          ],
        );
  }
}
