// import 'package:equatable/equatable.dart';
import 'package:asbeza_1/model/food.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetPressed extends HomeEvent {
  @override
  List<Object> get props => [];
}

class FoodFetchEvent extends HomeEvent {
  const FoodFetchEvent();

  @override
  List<Object> get props => [];
}

class HistoryEvent extends HomeEvent {
  final Item foods;
  const HistoryEvent({required this.foods});

  @override
  List<Object> get props => [];

  get data => foods;
}
