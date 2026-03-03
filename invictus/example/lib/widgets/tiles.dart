import 'package:flutter/material.dart';

class NewGridTile extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? icon;
  final Widget? label;

  const NewGridTile({super.key, this.onPressed, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final label = this.label;
    final style = Theme.of(context).textTheme.labelLarge;
    return IconButton.filledTonal(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(),
        iconSize: 40.0,
      ),
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ?icon,
          if (label != null && style != null)
            DefaultTextStyle(style: style, textAlign: .center, child: label),
        ],
      ),
    );
  }
}
