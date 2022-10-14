import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/consts/colors.dart';
import '../widgets/inkwell_widget.dart';
import '../widgets/material_button_widget.dart';

class CodeScreen extends StatefulWidget {
  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
              InkWellWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 20.h,
                    width: double.infinity,
                    alignment: AlignmentDirectional.centerStart,
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      color: mainColor,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 280.h,
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/codeScreen.png'))),
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(16.r)),
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        colors: [
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(1),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.9),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.85),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.8),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.75),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.7),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.65),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.6),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.5),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.4),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.3),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.2),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.1),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.05),
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0),
                        ],
                        begin: Alignment.bottomCenter,
                      )),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Text(
                AppLocalizations.of(context)!.enter_code_text,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline2,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                AppLocalizations.of(context)!.enter_code_sub_text,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(
                    color: MediaQuery
                        .of(context)
                        .platformBrightness ==
                        Brightness.light
                        ? const Color(0xFF525252)
                        : const Color(0xFFB0B0B0)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24.h,
              ),
              _buildASD(),
              SizedBox(
                height: 70.h,
              ),
              MaterialButtonWidget(
                label: AppLocalizations.of(context)!.login,
                onPressed: () {
                  print('abed');
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildASD(){
     const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border (bottom: BorderSide(
          color: Colors.black,
          width: 2,
        )),
      ),
    );
    return   Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
              AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                return value == '2222' ? null : 'Pin is incorrect';
              },

              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 2,
                    height: 22,
                    color:Colors.blueAccent,
                  ),
                ],
              ),

              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border (bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  )),     ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: Colors.black),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border(bottom: BorderSide(
                  color: Colors.red,
                  width: 2,
                )),
              ),
            ),
          ),

        ],
      ),
    );
   }
}
