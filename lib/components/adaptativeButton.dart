import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final Widget childWidget;
  final Function onPressed;
  final Color color;
  final EdgeInsets padding;

  AdaptativeButton({ @required this.childWidget, this.onPressed, this.color, this.padding = const EdgeInsets.all(8) });

  @override
  Widget build(BuildContext context) {    
    return Platform.isIOS
        ? CupertinoButton(
            child: childWidget,
            onPressed: this.onPressed,
            color: this.color ?? Theme.of(context).primaryColor,
            padding: this.padding,
          )
        : RaisedButton(
            child: childWidget,
            onPressed: this.onPressed,
            color: this.color ?? Theme.of(context).primaryColor,
            padding: this.padding,
          );
  }
}
