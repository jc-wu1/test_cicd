part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

/// Notifies bloc to increment state.
class Increment extends CounterEvent {}

/// Notifies bloc to decrement state.
class Decrement extends CounterEvent {}
