import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/featuers/auth/presentation/pages/login_screen.dart';

import '../../../../core/consts/colors.dart';
import '../../../../core/widget/back_icon.dart';
import '../widgets/inkwell_widget.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

import '../widgets/material_button_widget.dart';

class PasswordUpdatedDoneScreen extends StatelessWidget {
  const PasswordUpdatedDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context: context),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const   BackIcon(),
                  SizedBox(
                    height: 120.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.updatedPassword,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                          ? const Color(0xFF484848)
                          : const Color(0xFFB0B0B0),
                       fontSize: 34.sp,
                      fontWeight: FontWeight.w300,


                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 200.h,
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/updatedDoneImg.png'))),
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.r)),
                          gradient: LinearGradient(
                            end: Alignment.topCenter,
                            colors: [
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(1),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.9),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.85),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.8),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.75),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.7),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.65),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.6),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.5),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.4),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.3),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.2),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.1),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.05),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0),
                            ],
                            begin: Alignment.bottomCenter,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.newPassText,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 16.sp,
                        color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                            ? const Color(0xFF484848)
                            : const Color(0xFFB0B0B0)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 100.h,
                  ),

                  MaterialButtonWidget(

                    label: AppLocalizations.of(context)!.login,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                    },
                  ),
                ])));
  }
}
