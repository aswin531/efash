import 'package:efash/features/products/blocs/productdetail/event.dart';
import 'package:efash/features/products/blocs/productdetail/state.dart';
import 'package:efash/features/products/data/datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsInitial()) {
    on<FetchProductDetailsEvent>(_onFetchProductDetailsEvent);
  }

  Future<void> _onFetchProductDetailsEvent(
    FetchProductDetailsEvent event, Emitter<ProductDetailsState> emit) async {
  emit(ProductDetailsLoading());
      try {
      // Fetch product details using the new method
      final productDetailModel = await getProductsByCategory(event.slug); // Adjust this to your fetching method

      // Access the product directly from the model
      final product = productDetailModel.product;

      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError('Failed to load product details: $e'));
    }
  }
}

