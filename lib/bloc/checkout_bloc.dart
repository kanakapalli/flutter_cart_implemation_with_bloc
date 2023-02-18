import 'dart:async';

import 'package:interviewtest/model/menu.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CartInit()) {
    on<AddMenuItemToCart>(_addItem);

    on<RemoveMenuItemToCart>(_removeItem);
  }

  /// old way of using bloc
  // @override
  // Stream<CheckoutState> mapEventToState(
  //   CheckoutEvent event,
  // ) async* {
  //   on<RemoveMenuItemToCart>((event, emit) {
  //     print("hello");
  //   });
  //   on<AddMenuItemToCart>(_addItem);
  //   // on<RemoveMenuItemToCart>(_removeItem);
  // }

  List<Dishes> cartDishes = [];
  List<String> asd = [];

  FutureOr<void> _addItem(
      AddMenuItemToCart event, Emitter<CheckoutState> emit) {
    cartDishes.add(event.dish);
    emit(CartUpdated(dishes: cartDishes));
    print('asdasd 22');

  }

  FutureOr<void> _removeItem(
      RemoveMenuItemToCart event, Emitter<CheckoutState> emit) {
    for (var i = 0; i < cartDishes.length; i++) {
      if (cartDishes[i].id == event.dish.id) {
        cartDishes.removeAt(i);
        break;
      }
      print(i);
    }
    emit(CartUpdated(dishes: cartDishes));
    print('asdasd');

  }
}
