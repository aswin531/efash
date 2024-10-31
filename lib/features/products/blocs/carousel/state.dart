import 'package:equatable/equatable.dart';

class CarouselState extends Equatable {
  final int currentPage;
  const CarouselState({required this.currentPage});

  CarouselState copyWith({int? currentPage}) {//optional parameter - create a new CarouselState object, with an option to update the currentPage property if a new value is provided
    return CarouselState(currentPage: currentPage ?? this.currentPage);//if new value is given new state will crreated(no value default value)
  }

  @override
  List<Object> get props => [currentPage];
}
