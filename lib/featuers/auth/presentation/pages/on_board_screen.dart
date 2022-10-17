import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:furniture_store/featuers/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:furniture_store/featuers/auth/presentation/manager/auth_bloc.dart';
import 'package:furniture_store/featuers/auth/presentation/pages/login_screen.dart';
import '../../../../core/consts/colors.dart';
import '../../../../core/pref/shared_pref_controller.dart';
import '../widgets/board_page.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var selectedItem = 0;

  List<String> body = [];

  List<String> head = [];

  List<String> images = [
    'assets/images/onboard1.png',
    'assets/images/onboard2.png',
    'assets/images/onboard3.png'
  ];

  List<String> coloredText = [];
  var controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    coloredText = ['', AppLocalizations.of(context)!.text_colored, ''];
    body = [
      AppLocalizations.of(context)!.body_board1,
      AppLocalizations.of(context)!.body_board2,
      AppLocalizations.of(context)!.body_board3,
    ];
    head = [
      AppLocalizations.of(context)!.head_board1,
      AppLocalizations.of(context)!.head_board2,
      AppLocalizations.of(context)!.head_board3,
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BoardPage(
                    body: body[index],
                    colorText: coloredText[index],
                    image: images[index],
                    head: head[index],
                  );
                },
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    selectedItem = index;
                  });
                },
                itemCount: 3),
            Container(
              margin: EdgeInsets.only(bottom: 36.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: selectedItem == 0
                            ? BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                gradient: RadialGradient(colors: [
                                  mainColor,
                                  secondaryColor,
                                  Theme.of(context).scaffoldBackgroundColor,
                                ]))
                            : const BoxDecoration(),
                        child: Container(
                          margin: EdgeInsets.all(7.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(222.r),
                            color:
                                selectedItem == 0 ? mainColor : secondaryColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: selectedItem == 1
                            ? BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                gradient: RadialGradient(colors: [
                                  mainColor,
                                  secondaryColor,
                                  Theme.of(context).scaffoldBackgroundColor,
                                ]))
                            : const BoxDecoration(),
                        child: Container(
                          margin: EdgeInsets.all(7.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(222.r),
                            color:
                                selectedItem == 1 ? mainColor : secondaryColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: selectedItem == 2
                            ? BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                gradient: RadialGradient(colors: [
                                  mainColor,
                                  secondaryColor,
                                  Theme.of(context).scaffoldBackgroundColor,
                                ]))
                            : const BoxDecoration(),
                        child: Container(
                          margin: EdgeInsets.all(7.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(222.r),
                            color:
                                selectedItem == 2 ? mainColor : secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: () {
                          SharedPrefController()
                              .saveBool(PrefKeys.showBoardScreen.name, true)
                              .then((value) {
                            if (value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => LoginScreen()));
                            }
                          });
                        },
                        child: Text(
                          'Skip',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 17.sp,
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.light
                                      ? const Color(0x88484848)
                                      : const Color(0xFFDCDCDC)),
                        ),
                      ),
                      Container(),
                      Container(),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: () {
                          if (selectedItem < 2) {
                            setState(() {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                              selectedItem++;
                            });
                          } else {
                            SharedPrefController()
                                .saveBool(PrefKeys.showBoardScreen.name, true)
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => LoginScreen()));
                            });
                          }
                        },
                        child: Card(
                          color: secondaryColor,
                          child: Container(
                            height: 25.w,
                            width: 25.w,
                            margin: EdgeInsets.all(4.r),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: mainColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
