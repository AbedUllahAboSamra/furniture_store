import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  static AuthBloc get(context) => BlocProvider.of(context);

   bool isSaveLogin = true;
   bool isAgreeToTerms = false;
   bool isShownBoardScreen = false;


  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler

     });
  }


  void saveLogin(bool value){
    emit(ChangingValueSaveLoginState());
    isSaveLogin = value;
    emit(ChangedValueSaveLoginState());
  }
  void changeIsAgreeToTerms(bool value){
    emit(ChangingValueAgreeState());
    isAgreeToTerms = value;
    emit(ChangedValueAgreeState());
  }

}
