import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Future<void> Function(String, double, DateTime) _newTransaction;

  TransactionForm(this._newTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _valueController = new TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _submitForm() async {
    final title = this._titleController.text;
    final value = double.tryParse(this._valueController.text) ?? 0.0;
    final date = _selectedDate;

    if (title.isEmpty || value <= 0 || date == null) {
      return;
    }

    await widget._newTransaction(title, value, date);
  }

  void _showDatePicker() async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    setState(() {
      _selectedDate = _selectedDate ?? DateTime.now();
    });
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
              controller: _titleController,
              onSubmitted: (_) {
                _submitForm();
              },
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: _valueController,
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              onSubmitted: (_) {
                _submitForm();
              },
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'Nenhuma data selecionada'
                        : DateFormat('dd/MM/y').format(_selectedDate)),
                  ),
                  FlatButton(
                    padding: EdgeInsets.only(right: 10),
                    onPressed: _showDatePicker,
                    child: Text('Selecionar data'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(8),
                  onPressed: _submitForm,
                  child: Text(
                    'Nova transação',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
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
