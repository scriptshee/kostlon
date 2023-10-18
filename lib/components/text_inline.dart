import 'package:flutter/material.dart';

class TextInline extends StatelessWidget {
  const TextInline({
    super.key,
    required this.label,
    required this.nama,
  });

  final String? label;
  final String? nama;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$label"),
          Text("$nama"),
        ],
      ),
    );
  }
}
