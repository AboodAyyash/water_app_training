import 'package:start/DB/db.dart' as db;
import 'package:start/models/category.dart';
import 'package:start/models/location.dart';
import 'package:start/models/product.dart';

List<LocationModel> locations = [];
List<CategoryModel> categories = [];
List<ProductModel> products = [];
List<ProductModel> cart = [];
List<ProductModel> favorate = [];

getLocation() {
  //locations = db.locations;
  for (var i = 0; i < db.locations.length; i++) {
    locations.add(
      LocationModel(id: db.locations[i]['id'], name: db.locations[i]['name']),
    );
  }
}

getCategories() {
  categories.add(CategoryModel(id: 0, name: "All Categories"));
  for (var i = 0; i < db.categories.length; i++) {
    categories.add(
      CategoryModel(id: db.categories[i]['id'], name: db.categories[i]['name']),
    );
  }
}

getProducts() {
  for (var i = 0; i < db.products.length; i++) {
    products.add(
      ProductModel(
        category: db.products[i]['category'].toString(),
        id: db.products[i]['id'].toString(),
        image: db.products[i]['image'].toString(),
        name: db.products[i]['name'].toString(),
        price: db.products[i]['price'].toString(),
      ),
    );
  }
}

addToCart(ProductModel product) {
  cart.add(product);
}

addToFavorate(ProductModel product) {
  favorate.add(product);
}

chechInCart(ProductModel product) {
  bool hasData = false;
  for (var i = 0; i < cart.length; i++) {
    if (product.id == cart[i].id) {
      hasData = true;
      break;
    }
  }
  return hasData;
}

chechInFavorite(ProductModel product) {
  bool hasData = false;
  for (var i = 0; i < favorate.length; i++) {
    if (product.id == favorate[i].id) {
      hasData = true;
      break;
    }
  }
  return hasData;
}

removeFromFavorite(ProductModel product) {
  favorate.remove(product);
}

removeFromCart(ProductModel product) {
  cart.remove(product);
}
