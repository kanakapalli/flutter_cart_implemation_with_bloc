part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutState {}

class CartInit extends CheckoutState {
}
class CartUpdated extends CheckoutState {
  final List<Dishes> dishes;

  CartUpdated({required this.dishes});
}
