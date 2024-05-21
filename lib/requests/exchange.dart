import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/currency.dart';

Future<Currency> fetchExchange(String currency) async {
  final params = {
    'apikey': 'fca_live_nuhqwYs6aFoL82GXotmvd0RcWb9Q0kCVciF5i30A',
    'base_currency': currency,
  };

  final url = Uri.parse('https://api.freecurrencyapi.com/v1/latest').replace(queryParameters: params);

  final res = await http.get(url);
  final status = res.statusCode;
  if (status != 200) {
    throw Exception('http.get error: statusCode= $status');
  }

  return Currency.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
}
