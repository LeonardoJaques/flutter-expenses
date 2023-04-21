import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const AdaptativeButton({
    super.key,
    this.label = '',
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed(),
            child: Text(label),
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20),
                textStyle: Theme.of(context).textTheme.titleSmall,
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.tertiary),
            onPressed: onPressed(),
            child: Text(label),
          );
  }
}
