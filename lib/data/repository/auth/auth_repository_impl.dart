import 'package:dartz/dartz.dart';
import 'package:spotify_clone_application/data/models/auth/create_user_request.dart';
import 'package:spotify_clone_application/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_application/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthenticationRepositoryImpl extends AuthRepository{
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserRequest createUserReq) async{
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

}