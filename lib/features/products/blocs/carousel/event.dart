import 'package:equatable/equatable.dart';

abstract class CarouselEvent extends Equatable {
  const CarouselEvent();

  @override
  List<Object> get props => [];
}

class PageChangeEvent extends CarouselEvent {
  final int newPage;
  const PageChangeEvent(this.newPage);

  @override
  List<Object> get props => [];
}
