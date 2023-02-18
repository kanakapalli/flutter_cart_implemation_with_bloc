part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent {}

class AddMenuItemToCart extends CheckoutEvent {
  final Dishes dish;

  AddMenuItemToCart({required this.dish});
}

class RemoveMenuItemToCart extends CheckoutEvent {
  final Dishes dish;
  RemoveMenuItemToCart({required this.dish});
}
