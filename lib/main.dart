import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/utils/theme.dart';
import 'package:furniture_store/featuers/auth/presentation/manager/auth_bloc.dart';
 import 'package:furniture_store/featuers/auth/presentation/pages/login_screen.dart';
import 'package:furniture_store/featuers/auth/presentation/pages/on_board_screen.dart';
import 'core/pref/shared_pref_controller.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await di.init();
  bool isShown =
      SharedPrefController().getValueFor<bool>(PrefKeys.showBoardScreen.name) ??
          false;
  await Firebase.initializeApp();
  runApp(MyApp(isShwon: isShown));
}

class MyApp extends StatelessWidget {
  final bool isShwon;

  MyApp({required this.isShwon});

  @override
  Widget build(BuildContext context) {
    var home = isShwon ? LoginScreen() :const OnBoardScreen();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<AuthBloc>(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(414, 896),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                home: home,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  AppLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ar', ''),
                ],
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: ThemeMode.dark,
                locale: const Locale('en', ''),
              );
            }));
  }
}
