import 'package:flutter/material.dart';

class BaseLabel extends StatelessWidget {
  const BaseLabel({super.key, required this.child, required this.color, required this.backgroundColor, required this.icon});
  final Widget child;
  final Color color;
  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorLabel extends StatelessWidget {
  const ErrorLabel({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BaseLabel(
      color: Colors.red,
      backgroundColor: Colors.red[100]!,
      icon: Icons.error,
      child: child,
    );
  }
}

class AlertLabel extends StatelessWidget {
  const AlertLabel({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BaseLabel(
      color: Colors.orange,
      backgroundColor: Colors.orange[100]!,
      icon: Icons.warning,
      child: child,
    );
  }
}

class SuccessLabel extends StatelessWidget {
  const SuccessLabel({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BaseLabel(
      color: Colors.green,
      backgroundColor: Colors.green[100]!,
      icon: Icons.check_circle,
      child: child,
    );
  }
}
