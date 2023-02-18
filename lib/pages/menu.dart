import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewtest/model/menu.dart';
import 'package:interviewtest/pages/cartscreen.dart';
import 'package:interviewtest/pages/widgets/counter.dart';

import '../bloc/checkout_bloc.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'menu',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                      BlocBuilder<CheckoutBloc, CheckoutState>(
                        builder: (context, state) {
                          if (state is CartUpdated) {
                            return Text(
                              '${state.dishes.toSet().length} Item',
                              style: const TextStyle(),
                            );
                          }
                          return const Text('add to cart');
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        return Colors.green;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: const Text('Place Order'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView.builder(
            // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            itemCount: dishesList.length,
            itemBuilder: (context, i) {
              return MenuItem(dish: dishesList[i]);
            }));
  }
}

class MenuItem extends StatelessWidget {
  final Dishes dish;
  const MenuItem({
    required this.dish,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: Image.asset(
                      'assets/img/menuimg.jpeg',
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.fitHeight,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("subheading"),
                          Text("heading"),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7 - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text("price"),
                            BlocBuilder<CheckoutBloc, CheckoutState>(
                              builder: (context, state) {
int value = 0;
if(state is CartUpdated){
  value = state.dishes.where((element) => element.id == dish.id).toList().length;
}
                                

                                return Counter(
                                    increment: () =>
                                        BlocProvider.of<CheckoutBloc>(context)
                                          ..add(AddMenuItemToCart(dish: dish)),
                                    init: value,
                                    decrement: () => context
                                        .read<CheckoutBloc>()
                                        .add(RemoveMenuItemToCart(dish: dish)));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1, // thickness of the line
          indent: 10, // empty space to the leading edge of divider.
          endIndent: 10, // empty space to the trailing edge of the divider.
          color: Colors.black
              .withOpacity(0.3), // The color to use when painting the line.
          height: 2, // The divider's height extent.
        ),
      ],
    );
  }
}
