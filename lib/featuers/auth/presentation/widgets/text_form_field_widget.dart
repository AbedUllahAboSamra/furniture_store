import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/consts/colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  String? hint;

  String? label;

  Function(String)? onChangeFunc;
  Function(String)? onSubmitFunc;
  TextInputType textInputType;
  TextEditingController controller;
  bool isPassword;

  TextFormFieldWidget({
    super.key,
    required this.hint,
    required this.label,
    required this.textInputType,
    required this.controller,
    this.onChangeFunc,
    this.onSubmitFunc,
    this.isPassword = false,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  var obscure = true;
  var counter  = 0;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onChanged: widget.isPassword ? (value){
        setState(() {
          counter = value.length;
        });
      }:widget.onChangeFunc,
      onFieldSubmitted: widget.onSubmitFunc,
      style: GoogleFonts.poppins(
          fontSize: 20.sp,
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? const Color(0xFF949494)
              : const Color(0xFFCCCCCC)),
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          hintStyle: widget.hint != null
              ? GoogleFonts.poppins(
                  fontSize: 20.sp,
                  color:  gray)
              : null,
          labelStyle: widget.label != null
              ? GoogleFonts.poppins(
                  fontSize: 20.sp,
                  color: gray)
              : null,
          suffix: widget.isPassword && counter !=0
              ? InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child: Icon(
                    obscure ? Icons.visibility_outlined : Icons.visibility_off,
                    color: const Color(0xFFB9B9B9),
                  ))
              : null),
    );
  }
}
