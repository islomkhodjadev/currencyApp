import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  final String apiKey = 'cd661f09a8694198d0c6047c';
  final String baseUrl = 'https://v6.exchangerate-api.com/v6';

  Future<double> getExchangeRate() async {
    final response = await http.get(
      Uri.parse('$baseUrl/$apiKey/latest/USD'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['conversion_rates']['UZS'];
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}