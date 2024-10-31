import 'package:efash/features/products/models/product_model.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Product productLocal;
  AddToCartEvent(this.productLocal);
}

class FetchCartItemEvent extends CartEvent{}

class RemoveFromCartEvent extends CartEvent {
  final int id; 
  RemoveFromCartEvent(this.id);
}

class ClearCartEvent extends CartEvent {}

class IncreaseQuantityEvent extends CartEvent {
  final int itemId;
  IncreaseQuantityEvent(this.itemId);
}

class DecreaseQuantityEvent extends CartEvent {
  final int itemId;
  DecreaseQuantityEvent(this.itemId);
}
