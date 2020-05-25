import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(int) onRemove;

  TransactionList({@required this.transactions, @required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return transactions.isNotEmpty
        ? NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView.builder(
              padding: EdgeInsets.only(right: 5, left: 5),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                var transaction = transactions[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        maxRadius: 28,
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8, left: 8),
                            child: Text(
                              '\$ ${transaction.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(DateFormat('dd MMMM y', 'pt-BR')
                        .format(transaction.date)),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? FlatButton.icon(
                            onPressed: () => this.onRemove(transaction.id),
                            icon: Icon(Icons.delete),
                            label: Text('Excluir'),
                            textColor: Colors.red[300],
                          )
                        : IconButton(
                            onPressed: () => this.onRemove(transaction.id),
                            icon: Icon(Icons.delete),
                            color: Colors.red[300],
                          ),
                  ),
                );
              },
            ),
          )
        : LayoutBuilder(
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
