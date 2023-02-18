import 'package:flutter/material.dart';
import 'package:interviewtest/pages/widgets/counter.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
        ),
        height: 200,
        child: Column(
          children: [
            Row(
              children: [
                const Text("title"),
                Counter(increment: () {
                  print("");
                }, decrement: () {
                  print("");
                }),
              ],
            ),
            Row(
              children: const [
                Text("subtile"),
                Text("price"),
              ],
            ),
          ],
        ));
  }
}
