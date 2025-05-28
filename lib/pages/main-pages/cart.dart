import 'package:flutter/material.dart';

Widget cartPage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text("3"),
      ),
    ],
  );
}
/* 
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("3"),
        ),
      ],
    );
  }
}
 */