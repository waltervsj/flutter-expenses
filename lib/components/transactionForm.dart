import 'package:flutter/material.dart';
import 'adaptativeButton.dart';
import 'adaptativeDatePicker.dart';
import 'adaptativeTextField.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 7,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) {
                  _submitForm();
                },
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                onSubmitted: (_) {
                  _submitForm();
                },
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChange: (newDate) => setState(() {
                  _selectedDate = newDate;
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    childWidget: Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
