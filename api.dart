import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = "http://127.0.0.1:5000"; // Replace with your Flask server URL

Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> data) async {
  final response = await http.post(Uri.parse('$baseUrl/place_order'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to place order');
  }
}

Future<List<dynamic>> getOrderDetails(int orderId) async {
  final response = await http.get(Uri.parse('$baseUrl/order_details/$orderId'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to get order details');
  }
}
