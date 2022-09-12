import 'package:flipclock/flip_card.dart';
import 'package:flutter/material.dart';

class FlipBox extends StatefulWidget {
  final double value;
  final bool? isHour;
  const FlipBox({Key? key, required this.value, this.isHour}) : super(key: key);

  @override
  State<FlipBox> createState() => _FlipBoxState();
}

class _FlipBoxState extends State<FlipBox> with TickerProviderStateMixin {
  late double oldValue;
  double animatedContainerHeight = 0;

  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    oldValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = 90;
    double width = 100;

    if (oldValue != widget.value) {
      setState(() {
        animatedContainerHeight = height;
      });
    }

    return SizedBox(
        height: height,
        width: width,
        child: Stack(children: [
          FlipCard(
            value: oldValue,
            isHour: widget.isHour,
          ),
          AnimatedContainer(
            duration: Duration(
              // duration of 1 because when removing the animated container,
              // the transition shouldn't be visible
              milliseconds: oldValue != widget.value ? 150 : 1,
            ),
            height: animatedContainerHeight,
            child: FlipCard(
              value: widget.value,
              isHour: widget.isHour,
            ),
            onEnd: () {
              setState(() {
                oldValue = widget.value;
                // remove animated container
                animatedContainerHeight = 0;
              });
            },
          ),
        ]));
  }
}
