import 'package:start/DB/db.dart' as db;
import 'package:start/models/category.dart';
import 'package:start/models/location.dart';

List<LocationModel> locations = [];
List<CategoryModel> categories = [];
getLocation() {
  //locations = db.locations;
  for (var i = 0; i < db.locations.length; i++) {
    locations.add(
      LocationModel(id: db.locations[i]['id'], name: db.locations[i]['name']),
    );
  }
}

getCategories() {
  //locations = db.locations;
  categories.add(CategoryModel(id: 0, name: "All Category"));
  for (var i = 0; i < db.categories.length; i++) {
    categories.add(
      CategoryModel(id: db.categories[i]['id'], name: db.categories[i]['name']),
    );
  }
}
