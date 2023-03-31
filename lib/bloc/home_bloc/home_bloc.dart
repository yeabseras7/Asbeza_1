import 'package:asbeza_1/db/service.dart';
import 'package:asbeza_1/model/food.dart';
import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

import '../../provider/provider.dart';
import 'home_event.dart';
import 'home_state.dart';

// part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _apiServiceProvider = ApiServiceProvider();
  final _service = Service();
  List history = [];
  List historyVals = [];
  HomeBloc() : super(FoodInitiate()) {
    on<GetPressed>((event, emit) async {
      emit(FoodLoading());
      try {
        final activity = await _apiServiceProvider.fetchItem();
        await _service.readItem().then((val) => {
              history = val,
            });
        historyVals = Item.histList(history);
        emit(FoodSuccess(food: activity!, historyVals));
      } catch (e) {
        emit(FoodInitiate());
      }
    });

    on<HistoryEvent>((event, emit) => {
          if (!historyVals.contains(event.data))
            {
              historyVals.add(event.data),
              _service.saveItem(event.data),
            }
        });
  }
}
