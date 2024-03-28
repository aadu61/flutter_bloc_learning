import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_events.dart';

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementEvent>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecrementEvent>((event, emit) {
      if (state == 0) {
        return;
      }
      emit(state - 1);
    });

    on<CounterResetEvent>((event, emit) {
      emit(state - state);
    });
  }
}
