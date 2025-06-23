import 'package:flutter/material.dart';
import 'package:start/controllers/home.dart';
import 'package:start/widgets/product.dart';

Widget favoritePage() {
  return favorate.isEmpty
      ? Center(child: Text("No Favorite Products"))
      : GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (int i = 0; i < favorate.length; i++)
            ProductWidget(product: favorate[i]),
        ],
      );
}
