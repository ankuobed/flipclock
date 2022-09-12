import 'dart:async';

import 'package:flipclock/flip_box.dart';
import 'package:flutter/material.dart';

class FlipClock extends StatefulWidget {
  const FlipClock({Key? key}) : super(key: key);

  @override
  State<FlipClock> createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock> {
  DateTime currentDateTime = DateTime.now();
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        currentDateTime = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffB1B1B1), width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlipBox(
                value: currentDateTime.hour.toDouble(),
                isHour: true,
              ),
              const SizedBox(width: 15),
              FlipBox(
                value: currentDateTime.minute.toDouble(),
              ),
              const SizedBox(width: 15),
              FlipBox(
                value: currentDateTime.second.toDouble(),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            height: 5,
            width: 150,
            color: const Color(0xffB1B1B1),
          ),
        )
      ],
    );
  }
}
