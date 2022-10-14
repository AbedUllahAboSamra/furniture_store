// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/featuers/auth/presentation/manager/auth_bloc.dart';
import 'package:furniture_store/featuers/auth/presentation/pages/create_account_screen.dart';
import 'package:furniture_store/featuers/auth/presentation/pages/forget_password_screen.dart';
import 'package:furniture_store/featuers/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/consts/colors.dart';
import '../widgets/material_button_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String SCREEN_NAME = '/LoginScreen';

  var controller = TextEditingController();
  var controller0 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        body: _buildBody(context),
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16.r),
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment: FractionalOffset.bottomRight,
                                        image: AssetImage(
                                            'assets/images/onboard2.png'),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16.r),
                                        bottomRight: Radius.circular(16.r)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.centerRight,
                                      image: AssetImage(
                                          'assets/images/login2.png'),
                                    ),
                                  ),
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
                              ),
                              Expanded(child: Container()),
                              Expanded(child: Container())
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 175.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 90.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.r),
                                        bottomRight: Radius.circular(16.r)),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.bottomCenter,
                                      image: AssetImage(
                                          'assets/images/login3.png'),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/login4.png'),
                                      fit: BoxFit.fill),
                                ),
                                child: Container(
                                  height: 60.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    end: Alignment.topCenter,
                                    colors: [
                                      Theme.of(context)
                                          .scaffoldBackgroundColor
                                          .withOpacity(1),
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
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.r),
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment:
                                            FractionalOffset.bottomCenter,
                                        image: AssetImage(
                                            'assets/images/login5.png'),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.r),
                                      bottomRight: Radius.circular(16.r),
                                      bottomLeft: Radius.circular(16.r),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/login6.png'),
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.topLeft,
                                    ),
                                  ),
                                  child: Container(
                                    height: 55.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16.r),
                                        ),
                                        gradient: LinearGradient(
                                          end: Alignment.topCenter,
                                          colors: [
                                            Theme.of(context)
                                                .scaffoldBackgroundColor
                                                .withOpacity(1),
                                            Theme.of(context)
                                                .scaffoldBackgroundColor
                                                .withOpacity(1),
                                            Theme.of(context)
                                                .scaffoldBackgroundColor
                                                .withOpacity(1),
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
                              ),
                              Expanded(child: Container()),
                              Expanded(child: Container())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 142.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/AppNameLogo.png'),
                        )),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormFieldWidget(
                        hint: AppLocalizations.of(context)!.email,
                        label: null,
                        controller: controller0,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextFormFieldWidget(
                        hint: AppLocalizations.of(context)!.password,
                        label: null,
                        controller: controller,
                        textInputType: TextInputType.emailAddress,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              bool value = AuthBloc.get(context).isSaveLogin;
                              AuthBloc.get(context).saveLogin(!value);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  width: 20.h,
                                  child: Checkbox(
                                    activeColor: mainColor,
                                    value: AuthBloc.get(context).isSaveLogin,
                                    splashRadius: 0,
                                    onChanged: (value) {},
                                    side: BorderSide(
                                      color: gray,
                                      width: 1.5.w,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.0.r),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .remember_password,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgetPasswordScreen()));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.forget_password,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: mainColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      MaterialButtonWidget(
                        label: AppLocalizations.of(context)!.login,
                        onPressed: () {
                          print('abed');
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                              child: Divider(
                                thickness: 1.5.h,
                              )),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(AppLocalizations.of(context)!.or,
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                fontWeight: FontWeight.w800
                            ),

                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Expanded(
                              child: Divider(
                                thickness: 1.5.h,
                              )),
                          SizedBox(
                            width: 5.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 34.h,
                            width: 34.h,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              onTap: () {},
                              child: Image(
                                image: AssetImage('assets/images/google.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                            height: 38.h,
                            width: 38.h,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              onTap: () {},
                              child: Image(
                                image: AssetImage('assets/images/gmail.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Container(
                            height: 34.h,
                            width: 34.h,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              onTap: () {},
                              child: Image(
                                image: AssetImage('assets/images/facebook.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dt_have_an_account,
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      fontSize: 14.sp,
                                    ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccountScreen()));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signup,
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
