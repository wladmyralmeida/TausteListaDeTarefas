import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixButton;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.label,
    this.validator,
    required this.controller,
    this.suffixButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // operador ternario que verifica
          //if(label != null) mostra label else mostra string vazia.
          // null = tipo, vir vazio != null ''
          if (label != null && label!.isNotEmpty) Text(label!),

          TextFormField(
            controller: controller,
            maxLines: 1,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: suffixButton,
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
