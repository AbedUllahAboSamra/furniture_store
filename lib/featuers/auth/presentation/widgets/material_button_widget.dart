import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialButtonWidget extends StatelessWidget {
  final String label;

  final Function() onPressed;
  final double elevation;
  bool isLoading;

  MaterialButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.elevation = 3.0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSize(
      clipBehavior: Clip.hardEdge,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 1500),
        child: Container(
            width: !isLoading ? double.infinity : 60.h,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(555555.r)
            ),
            child: Card(
              elevation: elevation,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(555555.r)),
              child: Container(
                width: double.infinity,
                height: 47.h,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [mainColor, secondaryColor],
                    ),
                    borderRadius: BorderRadius.circular(55555.r)),
                child: MaterialButton(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: onPressed,
                  child: isLoading
                      ? Container(
                          width: 15.w,
                          height: 15.w,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        )
                      : Text(
                          label,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            )));
  }
}
