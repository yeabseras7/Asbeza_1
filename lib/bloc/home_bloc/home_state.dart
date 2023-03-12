import 'package:asbeza_1/model/food.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class FoodInitiate extends HomeState {}

class FoodLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class FoodSuccess extends HomeState {
  final List food;
  final List history;
  const FoodSuccess(this.history, {required this.food});
}

class FoodFailed extends HomeState {
  final String error;
  const FoodFailed(this.error);

  @override
  List<Object> get props => [error];
}
