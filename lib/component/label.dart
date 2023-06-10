// Flutter imports:
import 'package:flutter/material.dart';

class AlertLabel extends StatefulWidget {
  final Widget child;
  const AlertLabel({super.key, required this.child});

  @override
  AlertLabelState createState() => AlertLabelState();
}

class AlertLabelState extends State<AlertLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red[100],
        border: const Border(left: BorderSide(color: Colors.red, width: 3)),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Icon(Icons.error, color: Colors.red, size: 20),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessLabel extends StatefulWidget {
  final Widget child;
  const SuccessLabel({super.key, required this.child});

  @override
  SuccessLabelState createState() => SuccessLabelState();
}

class SuccessLabelState extends State<SuccessLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green[100],
        border: const Border(left: BorderSide(color: Colors.green, width: 3)),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
