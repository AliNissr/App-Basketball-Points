
import 'package:basketballpoints/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterAIncrementState());
  int teamApoint = 0;
  int teamBpoint = 0;
  void teamIncrement(String team, int buttonnumber) {
    if (team == 'A') {
      teamApoint += buttonnumber;
      emit(CounterAIncrementState());
    }
    if(team == 'B'){
      teamBpoint += buttonnumber;
      emit(CounterBIncrementState());
    }
  }
}