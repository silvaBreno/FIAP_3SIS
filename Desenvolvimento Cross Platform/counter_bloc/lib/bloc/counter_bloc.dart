import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementEvent>(_onIncrementEvent);
    on<DecrementEvent>(_onDecrementEvent);
  }

  void _onIncrementEvent(IncrementEvent event, Emitter emit) {
    emit(IncrementState(counter: state.counter + 1));
  }

  void _onDecrementEvent(DecrementEvent event, Emitter emit) {
    emit(DecrementState(counter: state.counter - 1));
  }
}
