import 'package:vending_app_poc/data/providers/buy_stock_transaction_provider.dart';
import '../../data/models/buy_stock_transaction_model.dart';

class BuyStockTransactionRepository {
  static Future<BuyStockModel> getTransactionDetails() async {
    BuyStockTransactionProvider provider = BuyStockTransactionProvider();
    final transactionData = await provider.getBuyStockTransactionDetails();
    final BuyStockModel details = BuyStockModel.fromJson(transactionData);
    return details;
  }
}
