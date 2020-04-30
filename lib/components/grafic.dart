import 'package:flutter/material.dart';

class Grafic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      width: double.infinity,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Gráfico',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
