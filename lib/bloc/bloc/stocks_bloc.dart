import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vending_app_poc/data/models/buy_stock_transaction_model.dart';
import 'package:vending_app_poc/data/repositories/buy_stock_transaction_repository.dart';

part 'stocks_event.dart';
part 'stocks_state.dart';

class StocksBloc extends Bloc<StocksEvent, StocksState> {
  StocksBloc() : super(StocsIsLoading()) {
    on<StocksEvent>((event, emit) async {
      if (event is GetStockTransaction) {
        try {
          BuyStockModel transaction =
              await BuyStockTransactionRepository.getTransactionDetails();

          emit(StockTransactionIsLoaded(transaction));
        } catch (e) {
          emit(StocsIsNotLoaded());
        }
      } else {
        emit(StocsIsNotLoaded());
      }
    });
  }
}
