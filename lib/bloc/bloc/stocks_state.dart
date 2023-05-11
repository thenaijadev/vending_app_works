part of 'stocks_bloc.dart';

abstract class StocksState extends Equatable {
  const StocksState();

  @override
  List<Object> get props => [];
}

class StocksInitial extends StocksState {}

class StocsIsLoading extends StocksState {}

class StocsIsNotLoaded extends StocksState {}

class StockTransactionIsLoaded extends StocksState {
  final BuyStockModel _transaction;
  const StockTransactionIsLoaded(this._transaction);
  BuyStockModel get getTransaction => _transaction;
  @override
  List<Object> get props => [_transaction];
}
