import 'package:efash/features/products/models/product_model.dart';

abstract class WatchListEvents {}

class AddToWatchList extends WatchListEvents {
  final Product productLocal;
  AddToWatchList(this.productLocal);
}

class FetchWatchList extends WatchListEvents {}

class RemoveFromWatchList extends WatchListEvents {
  final int id;
  RemoveFromWatchList(this.id);
}

class CheckProductInWatchList extends WatchListEvents {
  final int id;
  CheckProductInWatchList(this.id);
}
class ToggleWatchListItem extends WatchListEvents {
  final Product product;
  ToggleWatchListItem(this.product);
}