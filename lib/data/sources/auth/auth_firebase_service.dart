import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone_application/data/models/auth/create_user_request.dart';

abstract class AuthFirebaseService{

  Future<void> signup(CreateUserRequest createUserRequest);
  Future<void> signIn();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{

  @override
  Future<void> signIn(){
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserRequest createUserRequest) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserRequest.email,
          password: createUserRequest.password);

    } on FirebaseAuthException catch(e){

    }
  }
}
