import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmitted;
  final Object decoration;
  final TextInputType keyboardType;

  AdaptativeTextField({this.controller, this.onSubmitted, this.decoration, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CupertinoTextField(
              controller: this.controller,
              onSubmitted: this.onSubmitted,
              decoration: this.decoration,
              keyboardType: keyboardType ?? null,
            ),
        )
        : TextField(
            controller: this.controller,
            onSubmitted: this.onSubmitted,
            decoration: this.decoration,
            keyboardType: keyboardType ?? null,
          );
  }
}
