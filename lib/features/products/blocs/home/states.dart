import 'package:efash/features/products/models/product_model.dart';
import 'package:efash/features/products/models/response_model.dart';

abstract class HomeStates {}

class HomeLoading extends HomeStates {}

class HomeLoaded extends HomeStates {
  final ResponseModel responseModel;

  HomeLoaded(this.responseModel);
}

class HomeError extends HomeStates {
  final String error;
  HomeError(this.error);
}

class HomeFiltered extends HomeStates {
  final List<Product> filteredProducts;
  HomeFiltered(this.filteredProducts);
}