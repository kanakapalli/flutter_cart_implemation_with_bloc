import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final Function increment;
  final int init;


  final Function decrement;

  const Counter({
    Key? key,
    required this.increment,
    required this.decrement,  this.init=0,
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  @override
  Widget build(BuildContext context) {
  int value = widget.init;
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              if (value != 0) {
                value--;

                widget.decrement();
                setState(() {});
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("can't go -ve values"),
                  duration: Duration(milliseconds: 800),
                ));
              }
            },
            child: const Text(
              "-",
              style: TextStyle(fontSize: 24),
            )),
        Text(value.toString(), style: const TextStyle(fontSize: 24)),
        GestureDetector(
            onTap: () {
              value++;
              widget.increment();
              setState(() {});
            },
            child: const Text("+", style: TextStyle(fontSize: 24)))
      ],
    );
  }
}
