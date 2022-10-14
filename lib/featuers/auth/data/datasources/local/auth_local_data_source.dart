import 'package:dartz/dartz.dart';
import 'package:furniture_store/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {

}

const String IsShown = "IsShown";

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  const AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
 bool? getIsShownBoardScreen()   {
    // TODO: implement getIsShownBoardScreen

    bool? isShown = sharedPreferences.getBool(IsShown);
    print("${isShown}isShownisShown");
    if (isShown!=null) {
      return isShown;
    } else {
      throw EmptyCacheException();
    }
  }

}
