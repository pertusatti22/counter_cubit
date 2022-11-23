import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
  void restart() => emit(CounterState(counterValue: restartCounter(state)));

  int restartCounter(state) {
    if (state.counterValue != null) {
      state.counterValue = state.counterValue - state.counterValue;
    }
    return state.counterValue;
  }
}
