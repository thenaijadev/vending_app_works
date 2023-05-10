// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class BuyStockTransactionProvider {
//   Future<Map<String, dynamic>> getBuyStockTransactionDetails() async {
//     var url = Uri.parse(
//       '',
//     );
//     var response = await http.Client().get(
//       url,
//     );

//     if (response.statusCode == 200) {
//       // final arr = jsonDecode(response.body);
//       // final weatherData = arr["main"];
//       // print(weatherData);
//       // return weatherData;
//     } else {
//       print(response.statusCode);
//       throw Exception();
//     }
//   }
// }
