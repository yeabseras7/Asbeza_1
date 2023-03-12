import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {}

class CartInitialState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccessState extends CartState {
  final List item;

  CartSuccessState(
    this.item,
  );

  @override
  List<Object> get props => [];
}

class CartFailState extends CartState {
  String message;

  CartFailState(this.message);

  @override
  List<Object> get props => [];
}
