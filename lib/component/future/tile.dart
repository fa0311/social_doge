// Flutter imports:
import 'package:flutter/material.dart';
import 'package:social_doge/component/loading.dart';

class FutureTile extends StatefulWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;

  final Future Function() onTap;
  const FutureTile({super.key, this.title, this.subtitle, this.leading, this.trailing, required this.onTap});

  @override
  FutureTileState createState() => FutureTileState();
}

class FutureTileState extends State<FutureTile> {
  late Widget? state;
  late GlobalKey key;

  @override
  void initState() {
    state = null;
    key = GlobalKey();
    super.initState();
  }

  Future onTap() async {
    try {
      setState(() => state = const LoadingIcon());
      await widget.onTap();
    } catch (e) {
      setState(() => state = const Icon(Icons.error, color: Colors.red));
      await Future.delayed(const Duration(seconds: 2));
      rethrow;
    } finally {
      setState(() => state = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      onTap: onTap,
      title: widget.title,
      subtitle: widget.subtitle,
      leading: widget.leading,
      trailing: state ?? widget.trailing,
    );
  }
}
