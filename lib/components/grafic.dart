import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';
import 'graficBar.dart';

class Grafic extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Grafic(this.recentTransactions);

  double get _weekSum {
    var value = 0.0;
    for (Transaction transaction in recentTransactions) {
      value += transaction.value;
    }
    return value;
  }

  List<Map<String, Object>> get groupedTransactions {
    final today = DateTime.now();
    return List.generate(7, (index) {
      final weekDay = today.subtract(
        Duration(days: index),
      );

      var totalDaySum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear)
          totalDaySum += recentTransactions[i].value;
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'value': totalDaySum.toStringAsFixed(2),
        'percentage': _weekSum != 0 ? totalDaySum / _weekSum : 0.0,
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    _weekSum;
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      width: double.infinity,
      child: Card(
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((transaction) {
            return Expanded(
              child: GraficBar(transaction),
            );
          }).toList(),
        ),
      ),
    );
  }
}
