import 'package:flutter/material.dart';

class NoExpenses extends StatelessWidget {
  const NoExpenses({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (ctx, constraints) {
          return Padding(
            padding: EdgeInsets.all(constraints.maxWidth * 0.05),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'No expenses yet',
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).textScaleFactor * 20,
                        fontFamily: 'Quicksand',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: constraints.maxWidth * 0.05),
                      child: Icon(
                        Icons.sentiment_dissatisfied,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: constraints.maxHeight * 0.05),
                  child: Container(
                    height: constraints.maxHeight * 0.5,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          );
        },
      );
  }
}
