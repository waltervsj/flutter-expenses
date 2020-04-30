import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Future<void> Function(String, double) _newTransaction;

  TransactionForm(this._newTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController titleController = new TextEditingController();

  final TextEditingController valueController = new TextEditingController();

  Future<void> _submitForm() async {

    final title = this.titleController.text;
    final value = double.tryParse(this.valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    await widget._newTransaction(title, value);
  }

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
              onSubmitted: (_) {
                _submitForm();
              },
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) {
                _submitForm();
              },
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: _submitForm,
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
