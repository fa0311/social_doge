// Flutter imports:
import 'package:flutter/material.dart';

class BaseLabel extends StatefulWidget {
  final Widget child;
  final Color color;
  final Color backgroundColor;
  final IconData icon;
  const BaseLabel({super.key, required this.child, required this.color, required this.backgroundColor, required this.icon});

  @override
  BaseLabelState createState() => BaseLabelState();
}

class BaseLabelState extends State<BaseLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border(left: BorderSide(color: widget.color, width: 3)),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(widget.icon, color: widget.color, size: 20),
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

class ErrorLabel extends StatefulWidget {
  final Widget child;
  const ErrorLabel({super.key, required this.child});

  @override
  ErrorLabelState createState() => ErrorLabelState();
}

class ErrorLabelState extends State<ErrorLabel> {
  @override
  Widget build(BuildContext context) {
    return BaseLabel(
      color: Colors.red,
      backgroundColor: Colors.red[100]!,
      icon: Icons.error,
      child: widget.child,
    );
  }
}

class AlertLabel extends StatefulWidget {
  final Widget child;
  const AlertLabel({super.key, required this.child});

  @override
  AlertLabelState createState() => AlertLabelState();
}

class AlertLabelState extends State<AlertLabel> {
  @override
  Widget build(BuildContext context) {
    return BaseLabel(
      color: Colors.orange,
      backgroundColor: Colors.orange[100]!,
      icon: Icons.warning,
      child: widget.child,
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
    return BaseLabel(
      color: Colors.green,
      backgroundColor: Colors.green[100]!,
      icon: Icons.check_circle,
      child: widget.child,
    );
  }
}
