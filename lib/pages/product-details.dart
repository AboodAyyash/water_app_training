import 'package:flutter/material.dart';
import 'package:start/controllers/home.dart';
import 'package:start/models/product.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text("Product Details"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (!chechInFavorite(widget.product)) {
                  addToFavorate(widget.product);
                } else {
                  removeFromFavorite(widget.product);
                }
              });
            },
            icon: Icon(
              Icons.favorite_outline,
              color:
                  chechInFavorite(widget.product)
                      ? Colors.redAccent
                      : Colors.white,
              size: 30,
            ),
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Image.asset(widget.product.image, height: 300, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              widget.product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.product.price} JOD",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFc67c4e),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (!chechInCart(widget.product)) {
                          addToCart(widget.product);
                        } else {
                          removeFromCart(widget.product);
                        }
                      });
                    },
                    icon: Icon(
                      chechInCart(widget.product)
                          ? Icons.done
                          : Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
