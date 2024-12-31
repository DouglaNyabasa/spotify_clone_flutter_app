import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone_application/data/models/auth/create_user_request.dart';

abstract class AuthFirebaseService{

  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<void> signIn();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{

  @override
  Future<void> signIn(){
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserRequest.email,
          password: createUserRequest.password);

      return Right('sign up successful');

    } on FirebaseAuthException catch(e){
      String message = '';
      if(e.code == 'weak-password'){
        message = 'The password provider is too weak';
      } else if (e.code == 'email-already-in-use'){
        message = 'An account already exists with that email';
      }
      return Left(message);

    }
  }
}
