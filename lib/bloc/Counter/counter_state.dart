import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
class CounterState extends Equatable{
  final int counter;
  //holds the current state of the counter.
  const CounterState({
    this.counter = 2
});
  //method allows creating a new state with updated values while keeping the existing state properties.
  CounterState copyWith({int? counter}){
    return CounterState(
      counter: counter ?? this.counter
    );

}
  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
