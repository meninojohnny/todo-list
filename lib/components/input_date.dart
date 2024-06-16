import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputDate extends StatefulWidget {
  final DateTime? dateController;
  final Function(DateTime) onSelectDate;
  const InputDate(
      {super.key, required this.dateController, required this.onSelectDate});

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: IconButton(
            onPressed: () {
              showDatePicker(
                context: context,
                firstDate: DateTime(2022),
                lastDate: DateTime.now().add(const Duration(days: 300)),
              ).then((value) {
                widget.onSelectDate(value!);
              });
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ),
        Text(widget.dateController != null
            ? DateFormat('dd/MM/yyyy').format(widget.dateController!)
            : "Selecionar data...")
      ],
    );
  }
}
