part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  late final int increase;
  late final int decrease;

  @override
  List<Object> get props => [increase, decrease];
}
