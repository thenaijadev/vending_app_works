class BuyStockModel {
  final String? transactionId;
  final String? transactionAmount;
  final String? merchant;
  final String? transactionName;
  final String? transactionDate;
  BuyStockModel(
      {required this.transactionDate,
      required this.transactionId,
      required this.transactionAmount,
      required this.merchant,
      required this.transactionName});

  factory BuyStockModel.fromJson(Map<String, dynamic> json) {
    return BuyStockModel(
        transactionDate: json["date_added"],
        transactionId: json["payment_id"],
        transactionAmount: json["amount"],
        merchant: json["merchant"],
        transactionName: json["transaction_name"]);
  }
}
