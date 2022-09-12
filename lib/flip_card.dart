import 'package:flutter/material.dart';

class FlipCard extends StatelessWidget {
  final double value;
  final bool? isHour;

  const FlipCard({
    Key? key,
    required this.value,
    this.isHour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.black;
    String amOrPm = 'AM';
    double formatedValue = value;

    if (isHour == true && value > 12) {
      amOrPm = 'PM';
      formatedValue = value % 12;
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 27, 27, 27),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 36, 36, 36),
              ),
            ),
          ],
        ),
        Text(
          formatedValue < 10
              ? '0${formatedValue.toInt().toString()}'
              : formatedValue.toInt().toString(),
          style: const TextStyle(
              fontSize: 60, color: Color.fromARGB(255, 220, 211, 211)),
        ),
        Divider(
          color: backgroundColor,
          thickness: 3,
        ),
        if (isHour == true) ...[
          Positioned(
              bottom: 4,
              left: 4,
              child: Text(
                amOrPm,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ))
        ]
      ],
    );
  }
}
