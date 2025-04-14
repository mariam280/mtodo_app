import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.onSaved, this.maxLines = 1, this.onChange});
  final void Function(String?)? onSaved;
  final String? hintText;
  final int? maxLines;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          }
          return null;
        },
        cursorColor: Colors.grey,
        maxLines: maxLines,
        onSaved: onSaved,
        onChanged: onChange,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          enabledBorder: buildBorder(),
          border: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ),
    );
  }
}
