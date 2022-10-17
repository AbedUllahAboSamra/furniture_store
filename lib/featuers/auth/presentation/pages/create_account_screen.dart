import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/consts/colors.dart';
import 'package:furniture_store/featuers/auth/data/model/user_model.dart';
import 'package:furniture_store/featuers/auth/presentation/manager/auth_bloc.dart';
import 'package:furniture_store/featuers/auth/presentation/pages/login_screen.dart';
import 'package:furniture_store/featuers/auth/presentation/widgets/material_button_widget.dart';
import 'package:furniture_store/featuers/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/snackbar_message.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(),
      );
    });
  }

  Widget _buildBody() {
    return BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/AppNameLogo.png'),
                          )),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        TextFormFieldWidget(
                            hint: AppLocalizations.of(context)!.fullName,
                            label: null,
                            textInputType: TextInputType.name,
                            controller: nameController),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextFormFieldWidget(
                            hint: AppLocalizations.of(context)!.email,
                            label: null,
                            textInputType: TextInputType.emailAddress,
                            controller: emailController),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextFormFieldWidget(
                            hint: AppLocalizations.of(context)!.phone,
                            label: null,
                            textInputType: TextInputType.phone,
                            controller: phoneController),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextFormFieldWidget(
                          hint: AppLocalizations.of(context)!.country,
                          label: null,
                          textInputType: TextInputType.name,
                          controller: countryController,
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextFormFieldWidget(
                          hint: AppLocalizations.of(context)!.password,
                          label: null,
                          textInputType: TextInputType.visiblePassword,
                          controller: passwordController,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextFormFieldWidget(
                          hint: AppLocalizations.of(context)!.confirmPassword,
                          label: null,
                          textInputType: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
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
                            AuthBloc.get(context)
                                .add(ChangeIsAgreeToTermsEvent(value: !value));
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
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MaterialButtonWidget(
                            label: AppLocalizations.of(context)!.signup,
                            isLoading: state is SignUpLoadingState,
                            onPressed: () {
                              if (emailController.text.isNotEmpty &&
                                  countryController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty &&
                                  passwordController.text ==
                                      confirmPasswordController.text &&
                                  confirmPasswordController.text.isNotEmpty &&
                                  nameController.text.isNotEmpty &&
                                  phoneController.text.isNotEmpty &&
                                  emailController.text.contains("@") &&
                                  emailController.text.contains(".") &&
                                  emailController.text.length >= 6) {
                                AuthBloc.get(context).add(SignUpEvent(
                                    user: UserModel(
                                  id: '',
                                  country: countryController.text,
                                  phone: phoneController.text,
                                  imageUrl:
                                      'http://graph.facebook.com/702855/picture',
                                  fullName: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                )));
                              } else {
                                SnackBarMessage().showErrorSnackBar(
                                    message: 'error', context: context);
                              }
                            }),
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
                              thickness: 1.5.h,color: MediaQuery.of(context).platformBrightness == Brightness.dark?Colors.white30:Colors.grey[300]!
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
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Colors.white30
                                        : Colors.grey[300]!)),
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
                                child: const Image(
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
                                child: const Image(
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
                                child: const Image(
                                  image:
                                      AssetImage('assets/images/facebook.png'),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
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
        },
        listener: (context, state) {});
  }
}
