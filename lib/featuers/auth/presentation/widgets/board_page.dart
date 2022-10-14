import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/consts/colors.dart';

class BoardPage extends StatelessWidget {
  String head = '';
  String body = '';
  String colorText = '';
  String image = '';

  BoardPage({
    super.key,
    required this.head,
    required this.body,
    required this.colorText,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 450.h,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.9),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.85),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.8),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.75),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.7),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.65),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.6),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.5),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.4),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.1),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.05),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
            ],
            begin: Alignment.bottomCenter,
          )),
        ),
      ),
      SizedBox(
        height: 16.h,
      ),
      Text(
        head,
        style: Theme.of(context).textTheme.headline4?.copyWith(
            fontSize: 50.sp, fontWeight: FontWeight.bold, color: mainColor),
      ),
      SizedBox(
        height: 28.h,
      ),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 45.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: body,
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextSpan(
                  text: ' ',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: mainColor),
                ),
                TextSpan(
                  text: colorText,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: mainColor),
                ),
              ],
            ),
          )),
      SizedBox(
        height: 40.h,
      ),
    ]);
  }
}
