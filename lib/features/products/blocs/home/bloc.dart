import 'package:efash/features/products/blocs/home/event.dart';
import 'package:efash/features/products/blocs/home/states.dart';
import 'package:efash/features/products/data/datasource.dart';
import 'package:efash/features/products/models/product_model.dart';
import 'package:efash/features/products/models/response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  List<Product> allProducts = [];
  HomeBloc() : super(HomeLoading()) {
    on<FetchHomeDetails>(_onFetchHomeDetails);
    on<SearchProducts>(_onSearchProducts);
  }

  //@override
  Future<void> _onFetchHomeDetails(
      FetchHomeDetails event, Emitter<HomeStates> emit) async {
    emit(HomeLoading());
    try {
      ResponseModel data = await getHomeDetails();
      // print(data);
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void _onSearchProducts(SearchProducts event, Emitter<HomeStates> emit) async {
    final query = event.query.toLowerCase();
    final filterProducts = allProducts
        .where((product) => product.name.toLowerCase().contains(query))
        .toList();
    emit(HomeFiltered(filterProducts));
  }
}
