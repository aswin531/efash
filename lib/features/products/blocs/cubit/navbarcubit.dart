import 'package:flutter_bloc/flutter_bloc.dart';

class Navbarcubit extends Cubit<int> {
  Navbarcubit() : super(0);//initial index

  void selectTab(int index) {
    emit(index);
  }
}
