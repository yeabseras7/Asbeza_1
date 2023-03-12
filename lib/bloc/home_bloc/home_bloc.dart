import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

import '../../provider/provider.dart';
import 'home_event.dart';
import 'home_state.dart';

// part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _apiServiceProvider = ApiServiceProvider();
  List history = [];
  HomeBloc() : super(FoodInitiate()) {
    on<GetPressed>((event, emit) async {
      emit(FoodLoading());
      try {
        final activity = await _apiServiceProvider.fetchItem();
        emit(FoodSuccess(food: activity!, history));
      } catch (e) {
        print(e);
        emit(FoodInitiate());
      }
    });

    on<HistoryEvent>((event, emit) => {history.add(event.data)});
  }
}
