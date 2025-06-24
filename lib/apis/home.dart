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
