import 'package:flutter/material.dart';

class SimpleInput extends StatelessWidget {
  const SimpleInput({
    super.key,
    required this.edtTitle,
    required this.edtDescription,
    required this.onTap,
    required this.actionTitle,
    required List<SimpleInput> childern,
  });

  final TextEditingController edtTitle;
  final TextEditingController edtDescription;
  final VoidCallback onTap;
  final String actionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: edtTitle,
          decoration: InputDecoration(
            labelText: 'Title',
            hintText: 'Enter title',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: edtDescription,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Description',
            hintText: 'Enter description',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: onTap, child: Text(actionTitle)),
      ],
    );
  }
}
