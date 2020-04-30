import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Fulana de Tal',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                  ),
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              ),
              Column(
                
                children: <Widget>[
                  Text(
                    'Teste 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Teste 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Teste 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Teste 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Teste 1',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        );
  }
}