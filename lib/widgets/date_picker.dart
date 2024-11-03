import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final String label;
  final String placeholder;
  final DateTime? selectedDate;
  const DatePicker({
    super.key,
    required this.label,
    required this.placeholder,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff232323),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.infinity, 54),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              side: BorderSide(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xff232323),
            elevation: 0,
          ),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(DateTime.now().year),
              lastDate: DateTime(2050),
            );
          },
          child: Row(
            children: [
              if (selectedDate != null)
                Text(
                  DateFormat('dd MMM yyyy').format(selectedDate!),
                ),
              if (selectedDate == null)
                Text(
                  placeholder,
                  style: const TextStyle(
                    color: Color(0xff718EBF),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
