import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  const DashInput({
    super.key,
    required this.label,
    required this.placeholder,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.obscureText = false,
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
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffDFEAF2),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: Color(0xff718EBF),
            ),
          ),
          validator: validator,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r"\s")),
            ...?inputFormatters,
          ],
          obscureText: obscureText,
        ),
      ],
    );
  }
}
