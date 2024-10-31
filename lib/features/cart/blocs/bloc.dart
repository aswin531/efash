import 'package:efash/features/cart/blocs/event.dart';
import 'package:efash/features/cart/blocs/state.dart';
import 'package:efash/features/cart/data/db/cart_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartOperations cart;

  CartBloc(this.cart) : super(CartInitial()) {
    on<AddToCartEvent>(_onAddToCartEvent);
    on<FetchCartItemEvent>(_onFetchCartItemEvent);
    on<RemoveFromCartEvent>(_onRemoveFromCartEvent);
    on<ClearCartEvent>(_onClearCartEvent);
    on<IncreaseQuantityEvent>(_onIncreaseQuantity);
    on<DecreaseQuantityEvent>(_onDecreaseQuantity);
  }

  Future<void> _onAddToCartEvent(
      AddToCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      // Add the product to the cart table in the database
      await cart.insertCartItem(event.productLocal);
      debugPrint('product added === ${event.productLocal}');
      add(FetchCartItemEvent());
    } catch (e) {
      emit(CartError("Failed to add to Cart"));
    }
  }

  Future<void> _onFetchCartItemEvent(
      FetchCartItemEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final cartItems = await cart.getCartItems();
      debugPrint('product retrieved === ${cartItems.toString()}');
      emit(CartLoaded(cartItems));
    } catch (e) {
      emit(CartError('Failed to load Cart items'));
    }
  }

  Future<void> _onRemoveFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    try {
      await cart.deleteCartItem(event.id);
      add(FetchCartItemEvent()); // Refresh cart after deletion
    } catch (e) {
      emit(CartError("Failed to remove item from Cart"));
    }
  }

  Future<void> _onClearCartEvent(
      ClearCartEvent event, Emitter<CartState> emit) async {
    try {
      await cart.clearCart();
      add(FetchCartItemEvent());
    } catch (e) {
      emit(CartError("Failed to clear Cart"));
    }
  }

  Future<void> _onIncreaseQuantity(
      IncreaseQuantityEvent event, Emitter<CartState> emit) async {
    await cart.increasecartQuantity(event.itemId);
    add(FetchCartItemEvent());
  }

  Future<void> _onDecreaseQuantity(
      DecreaseQuantityEvent event, Emitter<CartState> emit) async {
    await cart.decreaseCartQuantity(event.itemId);
    add(FetchCartItemEvent());
  }
}
