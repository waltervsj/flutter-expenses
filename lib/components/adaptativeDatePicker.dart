import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  AdaptativeDatePicker({this.selectedDate, this.onDateChange});

  void _showDatePicker(BuildContext context) async {
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    onDateChange(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              onDateTimeChanged: onDateChange,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2020),
              maximumDate: DateTime.now(),
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(this.selectedDate == null
                      ? 'Nenhuma data selecionada'
                      : DateFormat('dd/MM/y').format(this.selectedDate)),
                ),
                FlatButton(
                  padding: EdgeInsets.only(right: 10),
                  onPressed: () => _showDatePicker(context),
                  child: Text('Selecionar data'),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          );
  }
}
