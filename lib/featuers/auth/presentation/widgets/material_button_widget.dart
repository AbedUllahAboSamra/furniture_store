import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialButtonWidget extends StatelessWidget {
    String label;

    Function() onPressed;

    MaterialButtonWidget(
      {  required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.r)
      ),
      child: Container(
        width: double.infinity,
        height: 47.h,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [mainColor, secondaryColor],
            ),
            borderRadius: BorderRadius.circular(40.r)
      ),
        child: MaterialButton(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          child: Text(
            label,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
