import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/appcolor.dart';

class TextFields extends StatefulWidget {
  const TextFields(
      {super.key,
      required this.type,
      required this.hints,
      required this.iconss});
  final TextInputType type;
  final String hints;
  final IconData? iconss;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          keyboardType: widget.type,
          style: const TextStyle(
              fontSize: 18,
              color: AppColor.purple,
              fontWeight: FontWeight.w600),
          cursorColor: Colors.black,
          cursorHeight: 20,
          onChanged: (val) {},
          textAlign: TextAlign.start,
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.form,
            contentPadding: const EdgeInsets.only(top: 10),
            prefixIcon: Icon(
              widget.iconss,
              color: AppColor.purple,
            ),
            hintText: widget.hints.tr,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: AppColor.purple,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide.none,
            ),
          ),
        ));
  }
}
