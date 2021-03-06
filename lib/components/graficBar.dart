import 'package:flutter/material.dart';

class GraficBar extends StatelessWidget {
  final Map<String, Object> transactionMap;

  GraficBar(this.transactionMap);

  @override
  Widget build(BuildContext context) {
    double percentage = transactionMap['percentage'];
    var value = double.tryParse(transactionMap['value']);
    var borderRadius = percentage > 0.90 ? 15.0 : 4.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.1,
              margin: EdgeInsets.all(7),
              child: FittedBox(
                child: Text(value.toStringAsFixed(0)),
              ),
            ),
            Expanded(
              child: Container(
                width: constraints.maxWidth * 0.275,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple[200],
                      offset: new Offset(2.0, 2.0),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: Colors.blue[200],
                      offset: new Offset(-2.0, -2.0),
                      blurRadius: 3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.bottomCenter,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  FractionallySizedBox(
                    heightFactor: transactionMap['percentage'],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(borderRadius),
                          topRight: Radius.circular(borderRadius),
                        ),
                        gradient: LinearGradient(
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight,
                          colors: [
                            Colors.blue,
                            Colors.deepPurple[300],
                            Colors.deepPurple,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple[200],
                            offset: new Offset(2.0, 2.0),
                            blurRadius: 3.0,
                          ),
                          BoxShadow(
                            color: Colors.blue[200],
                            offset: new Offset(-1.0, -1.0),
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.1,
              margin: EdgeInsets.only(
                top: constraints.maxHeight * 0.025,
                bottom: constraints.maxHeight * 0.05,
              ),
              child: Text(
                transactionMap['day'],
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            )
          ],
        );
      },
    );
  }
}
