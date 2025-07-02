import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:start/shared/shared.dart';

Future getProductsURL() async {
  var response = await http.get(
    Uri.parse("$baseURL/products"),
    headers: {'Authorization': 'Bearer Y29kZXg6cmVzdF9hcGlfdGVzdAo='},
  );
  return jsonDecode(response.body);
}

Future getCategoriesURL() async {
  print("$baseURL/categories");
  var response = await http.get(
    Uri.parse("$baseURL/categories"),
    headers: {'Authorization': 'Bearer Y29kZXg6cmVzdF9hcGlfdGVzdAo='},
  );
  return jsonDecode(response.body);
}

Future postCartURL(productId) async {
  var response = await http.post(
    Uri.parse("$baseURL/cart"),
    headers: {'Authorization': 'Bearer Y29kZXg6cmVzdF9hcGlfdGVzdAo='},
    body: jsonEncode({'id': productId}),
  );
  print(response.statusCode);
  print(response.body);
  return jsonDecode(response.body);
}

Future deleteCartURL(productId) async {
  var response = await http.delete(
    Uri.parse("$baseURL/cart?id=$productId"),
    headers: {'Authorization': 'Bearer Y29kZXg6cmVzdF9hcGlfdGVzdAo='},
    //body: jsonEncode({'id': productId}),
  );
  print(response.statusCode);
  print(response.body);
  return {};
}

Future getCartURL() async {
  var response = await http.get(
    Uri.parse("$baseURL/cart"),
    headers: {'Authorization': 'Bearer Y29kZXg6cmVzdF9hcGlfdGVzdAo='},
  );
  return jsonDecode(response.body);
}

Future login({email, password}) async {
  try {
    var response = await http.post(
      Uri.parse("$baseURL/login"),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Authorization': 'Bearer Y29kZXg6cmVzdF9hcGlfdGVzdAo='},
    );
    print(response.statusCode);
    return {"body": jsonDecode(response.body), "status": response.statusCode};
  } catch (e) {
    print(e);
  }
}

Future profile({userId}) async {
  try {
    var response = await http.get(
      Uri.parse("$baseURL/users?id=$userId"),

      headers: {'Authorization': 'Bearer Y29kZXg6cmVzdF9hcGlfdGVzdAo='},
    );
    print(response.statusCode);
    return {"body": jsonDecode(response.body), "status": response.statusCode};
  } catch (e) {
    print(e);
  }
}

//login
