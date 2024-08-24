import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {
  final double scrollPosition;
  final double scrollMax;
  final double containerWidth;

  const ScrollIndicator({
    super.key,
    required this.scrollPosition,
    required this.scrollMax,
    required this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    double indicatorWidth = 150.0;
    double position = (scrollMax == 0)
        ? 0
        : (scrollPosition / scrollMax) * (containerWidth - indicatorWidth);

    return Container(
      width: containerWidth,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        width: indicatorWidth,
        height: 8,
        margin: EdgeInsets.only(left: position),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
