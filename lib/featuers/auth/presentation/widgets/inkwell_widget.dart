import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InkWellWidget extends StatelessWidget {
  final Widget child;

  final Color splashColor;
  final Color highlightColor;
  final Color focusColor;
  final Function() onTap;

  const InkWellWidget({
    super.key,
    this.splashColor = Colors.transparent,
    this.highlightColor = Colors.transparent,
    this.focusColor = Colors.transparent,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        splashColor: splashColor,
        highlightColor: splashColor,
        focusColor: focusColor,
        onTap: onTap,
        child: child,
    );
  }
}
