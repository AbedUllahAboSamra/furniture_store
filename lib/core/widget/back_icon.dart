


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../featuers/auth/presentation/widgets/inkwell_widget.dart';
import '../consts/colors.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key,  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          height: 20.h,
          width: 30.w,
          alignment: AlignmentDirectional.centerStart,
          child: const Icon(
            Icons.arrow_back_sharp,
            color: mainColor,
          )),
    );
  }
}
