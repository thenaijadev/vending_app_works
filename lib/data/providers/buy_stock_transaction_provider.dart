import 'package:http/http.dart' as http;
import 'dart:convert';

class BuyStockTransactionProvider {
  Future<Map<String, dynamic>> getBuyStockTransactionDetails() async {
    try {
      var url = Uri.parse(
        'https://payment.nubiaville.com/welcome/getpayment',
      );
      var response = await http.Client().get(
        url,
      );

      if (response.statusCode == 200) {
        final arr = jsonDecode(response.body);

        final details = arr[0];

        return details;
      } else {
        print(response.statusCode);
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
