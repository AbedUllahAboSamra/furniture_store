import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_store/featuers/auth/data/model/user_model.dart';

import '../../../../../core/error/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInUser({
    required String email,
    required String password,
  });

  Future<UserModel> signUpUser({required UserModel user});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth auth;

  final FirebaseFirestore fireStore;

  AuthRemoteDataSourceImpl({
    required this.auth,
    required this.fireStore,
  });

  @override
  Future<UserModel> signInUser({
    required String email,
    required String password,
  }) async {
    // TODO: implement signInUser

    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (user.user != null) {
      var userData =
          await fireStore.collection('user').doc(user.user!.uid).get();
      if (userData.data() != null) {
        return UserModel.fromJson(json: userData.data()!);
      } else {
        throw ServerErrorException();
      }
    } else {
      throw ServerErrorException();
    }
  }

  @override
  Future<UserModel> signUpUser({required UserModel user}) async {
    // TODO: implement signUpUser
    print('object111');

    final usr = await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);

    if (usr.user != null) {
      user.id = usr.user!.uid;
       final usrData = await fireStore.collection('user').doc(usr.user!.uid).set(user.toJson());
      return user;
    }else{
      throw ServerErrorException();
    }
  }
}
