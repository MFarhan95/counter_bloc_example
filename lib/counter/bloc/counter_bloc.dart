import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    ///registering event handlers
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
  }

  void _onIncrement(Increment event, Emitter<int> emit) {
    emit(state + 1);
  }

  void _onDecrement(Decrement event, Emitter<int> emit) {
    emit(state - 1);
  }
}
