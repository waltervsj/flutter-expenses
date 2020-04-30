import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController titleController = new TextEditingController();
  final TextEditingController valueController = new TextEditingController();

  final void Function(String, double) _newTransaction;

  TransactionForm(this._newTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    _newTransaction(
                      this.titleController.text,
                      double.tryParse(this.valueController.text),
                    );
                  },
                  child: Text(
                    'Nova transação',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
