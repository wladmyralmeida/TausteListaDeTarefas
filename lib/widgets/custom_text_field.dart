import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? label;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.label,
    required this.controller,
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
          TextField(
            controller: controller,
            maxLines: 1,
            decoration: InputDecoration(
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
