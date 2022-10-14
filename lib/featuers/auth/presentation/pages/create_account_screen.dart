import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/consts/colors.dart';
import 'package:furniture_store/featuers/auth/presentation/manager/auth_bloc.dart';
import 'package:furniture_store/featuers/auth/presentation/pages/login_screen.dart';
import 'package:furniture_store/featuers/auth/presentation/widgets/material_button_widget.dart';
import 'package:furniture_store/featuers/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(context),
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    width: 142.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/AppNameLogo.png'),
                    )),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextFormFieldWidget(
                      hint: 'Full Name',
                      label: null,
                      textInputType: TextInputType.name,
                      controller: nameController),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormFieldWidget(
                      hint: 'Email',
                      label: null,
                      textInputType: TextInputType.emailAddress,
                      controller: nameController),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormFieldWidget(
                      hint: 'Phone',
                      label: null,
                      textInputType: TextInputType.phone,
                      controller: nameController),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormFieldWidget(
                      hint: 'Country',
                      label: null,
                      textInputType: TextInputType.name,
                      controller: nameController),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormFieldWidget(
                    hint: 'Password',
                    label: null,
                    textInputType: TextInputType.visiblePassword,
                    controller: nameController,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormFieldWidget(
                    hint: 'Confirm Password',
                    label: null,
                    textInputType: TextInputType.visiblePassword,
                    controller: nameController,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: () {
                      bool value = AuthBloc.get(context).isAgreeToTerms;
                      AuthBloc.get(context).changeIsAgreeToTerms(!value);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: Checkbox(
                            activeColor: mainColor,
                            value: AuthBloc.get(context).isAgreeToTerms,
                            splashRadius: 0,
                            onChanged: (value) {},
                            side: BorderSide(
                              color: gray,
                              width: 1.5.w,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0.r),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          AppLocalizations.of(context)!.iAgree,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MaterialButtonWidget(
                      label: AppLocalizations.of(context)!.signup,
                      onPressed: () {}),
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
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontWeight: FontWeight.w800),
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
                    height: 18.h,
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
                        width: 24.w,
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
                    height: 18.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.alreadyHaveAccount,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
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
            )));
  }
}
