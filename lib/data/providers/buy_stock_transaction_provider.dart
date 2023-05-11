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

  static Future<void> updateTransactionStatus(
    String id,
  ) async {
    var url =
        Uri.https("payment.nubiaville.com", "/welcome/updatePaymentStatus");
    try {
      var response = await http.post(url,
          body: jsonEncode({"payment_id": id, "status": "Successful"}));
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
// }

// https://payment.nubiaville.com/welcome/updatePaymentStatus
// var url = Uri.https('example.com', 'whatsit/create');
// var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');

// print(await http.read(Uri.https('example.com', 'foobar.txt')));