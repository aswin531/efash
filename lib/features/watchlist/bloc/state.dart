import 'package:efash/features/products/models/product_model.dart';

abstract class WatchListStates {}

class WatchlistInitial extends WatchListStates {}

class WatchlistLoading extends WatchListStates {}

class WatchListLoaded extends WatchListStates {
  final List<Product> items;
  WatchListLoaded(this.items);
}

class WatchistProductStatus extends WatchListStates {
  final bool isInWatchlist;
  final int productId; 
  WatchistProductStatus(this.isInWatchlist, this.productId);
}


class WatchListError extends WatchListStates {
  final String message;
  WatchListError(this.message);
}
class WatchlistOperationSuccess extends WatchListStates {
  final String message;
  WatchlistOperationSuccess(this.message);
}
