
part of "counter_bloc.dart";

sealed class CounterEvents{}

class CounterIncrementEvent extends CounterEvents{}
class CounterDecrementEvent extends CounterEvents{}
class CounterResetEvent extends CounterEvents{}

