import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/checkout_bloc.dart';
import 'widgets/counter.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: BlocBuilder<CheckoutBloc, CheckoutState>(
//       builder: (context, state) {
//         if (state is CartUpdated) {
//           return const CartScreen();
//         }
//         return const Text("Loading");
//       },
//     ));
//   }
// }

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('cart'),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        bottomNavigationBar: Container(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  double total = 0;
                  if (state is CartUpdated)
                    for (var element in (state).dishes) {
                      total += element.price;
                    }
                  return Text(
                    "\$$total",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  );
                },
              ),
            ],
          ),
        )),
        body: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CartUpdated) {
              return ListView.builder(
                  // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  itemCount: state.dishes.toSet().length,
                  itemBuilder: (context, i) {
                    return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            // color: Colors.amber,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.dishes
                                        .toSet()
                                        .elementAt(i)
                                        .title),
                                    Text(state.dishes
                                        .toSet()
                                        .elementAt(i)
                                        .subtitle),
                                  ],
                                ),
                                Counter(
                                     increment: () =>
                                        BlocProvider.of<CheckoutBloc>(context)
                                          ..add(AddMenuItemToCart(dish: state.dishes
                                                  .toSet()
                                                  .elementAt(i))),
                                    init: state.dishes
                                        .where((element) =>
                                            state.dishes
                                                .toSet()
                                                .elementAt(i)
                                                .id ==
                                            element.id)
                                        .toList()
                                        .length,
                                    decrement: () =>
                                      BlocProvider.of<CheckoutBloc>(context)
                                        ..add(RemoveMenuItemToCart(
                                            dish: state.dishes
                                                .toSet()
                                                .elementAt(i))),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "+ Add Notes ",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                ),
                                Text("22.4"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1, // thickness of the line
                              indent:
                                  10, // empty space to the leading edge of divider.
                              endIndent:
                                  10, // empty space to the trailing edge of the divider.
                              color: Colors.black.withOpacity(
                                  0.3), // The color to use when painting the line.
                              height: 2, // The divider's height extent.
                            ),
                          ],
                        ));
                  });
            } else {
              return const Center(child: Text("nothing in cart"));
            }
          },
        ));
  }
}
