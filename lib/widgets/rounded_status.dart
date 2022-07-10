import 'package:flutter/material.dart';

class RoundedStatus extends StatelessWidget {
  const RoundedStatus({Key? key, required this.index, required this.data})
      : super(key: key);
  final int index;
  final List data;
  @override
  Widget build(BuildContext context) {
    return roundedStatus(context, data, index);
  }

  roundedStatus(context, data, index) {
    if (data[index].status == 'Dead') {
      return const Icon(
        Icons.circle,
        color: Colors.red,
        size: 20,
        semanticLabel: 'dead',
      );
    } else if (data[index].status == 'Alive') {
      return const Icon(
        Icons.circle,
        color: Colors.green,
        size: 20,
        semanticLabel: 'alive',
      );
    } else {
      return const Icon(
        Icons.circle,
        color: Colors.yellow,
        size: 20,
        semanticLabel: 'unknown',
      );
    }
  }
}