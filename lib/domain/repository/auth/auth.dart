import 'package:dartz/dartz.dart';
import 'package:spotify_clone_application/data/models/auth/create_user_request.dart';

abstract class AuthRepository{


  Future<Either> signup(CreateUserRequest createUserReq);
  Future<void> signIn();
}