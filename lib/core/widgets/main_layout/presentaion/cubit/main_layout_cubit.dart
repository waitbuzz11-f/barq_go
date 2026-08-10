// main_layout_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutCubit extends Cubit<int> {
  MainLayoutCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}