part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int counter;

  const CounterState({
    required this.counter,
  });

  @override
  List<Object> get props => [counter];
}

final class CounterInitial extends CounterState {
  const CounterInitial({super.counter = 0});
}

class IncrementState extends CounterState {
  const IncrementState({required super.counter});
}
