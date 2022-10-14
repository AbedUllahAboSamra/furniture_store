import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/consts/colors.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:furniture_store/featuers/auth/presentation/pages/code_screen.dart';
import 'package:furniture_store/featuers/auth/presentation/widgets/text_form_field_widget.dart';

import '../widgets/inkwell_widget.dart';
import '../widgets/material_button_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final controller0 = TextEditingController();

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
                    image: AssetImage('assets/images/person.png'))),
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(16.r)),
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.9),
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(.85),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.8),
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(.75),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.7),
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(.65),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.6),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.5),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.4),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.1),
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(.05),
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                  )),
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Text(
            AppLocalizations.of(context)!.forget_password,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppLocalizations.of(context)!.forget_pass_text,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? const Color(0xFF525252)
                    : const Color(0xFFB0B0B0)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 70.h,
          ),
          TextFormFieldWidget(
            hint: AppLocalizations.of(context)!.email,
            label: null,
            controller: controller0,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 70.h,
          ),
          MaterialButtonWidget(
            label: AppLocalizations.of(context)!.login,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CodeScreen()));
            },
          ),
        ],
      ),
    ));
  }
}
