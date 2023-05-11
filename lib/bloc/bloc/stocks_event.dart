part of 'stocks_bloc.dart';

abstract class StocksEvent extends Equatable {
  const StocksEvent();

  @override
  List<Object> get props => [];
}

class GetStockTransaction extends StocksEvent {
  @override
  List<Object> get props => [];
}
