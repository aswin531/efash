import 'package:efash/features/products/blocs/products/event.dart';
import 'package:efash/features/products/blocs/products/state.dart';
import 'package:efash/features/products/data/datasource.dart';
import 'package:efash/features/products/models/product_return.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoading()) {
    on<FetchProductDetails>(_onFetchProductDetails);
  }

  Future<void> _onFetchProductDetails(
      FetchProductDetails event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      ProductsResponse data = await getProducts(); 
      emit(ProductLoaded(data.productReturn)); 
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
