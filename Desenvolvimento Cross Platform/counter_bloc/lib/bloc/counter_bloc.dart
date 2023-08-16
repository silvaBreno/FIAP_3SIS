import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementEvent>(_onIncrementEvent);
  }

  void _onIncrementEvent(IncrementEvent event, Emitter emit) {
    emit(IncrementState(counter: state.counter + 1));
  }
}
