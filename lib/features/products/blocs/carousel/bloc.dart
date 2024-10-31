import 'package:efash/features/products/blocs/carousel/event.dart';
import 'package:efash/features/products/blocs/carousel/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(const CarouselState(currentPage: 0)) {
    on<PageChangeEvent>((event, emit) {
      emit(state.copyWith(currentPage: event.newPage));
    });
  }
}
