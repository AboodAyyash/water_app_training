import 'package:start/DB/db.dart' as db;
import 'package:start/apis/home.dart';
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

Future getProducts() async {
  await getProductsURL().then((onValue) {
    print(onValue.length);
    for (var i = 0; i < onValue.length; i++) {
      products.add(
        ProductModel(
          category: onValue[i]['category_id'].toString(),
          id: onValue[i]['id'].toString(),
          image: onValue[i]['image_url'].toString(),
          name: onValue[i]['name'].toString(),
          price: onValue[i]['price'].toString(),
        ),
      );
    }
  });
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
