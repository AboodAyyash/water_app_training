import 'package:flutter/material.dart';
import 'package:start/controllers/home.dart';
import 'package:start/models/product.dart';
import 'package:start/pages/product-details.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder:
                (BuildContext context) =>
                    ProductDetails(product: widget.product),
          ),
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.product.image,
                  height: 130,
                  fit: BoxFit.cover,
                ),
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
