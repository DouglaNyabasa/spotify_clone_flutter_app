import 'package:dartz/dartz.dart';
import 'package:spotify_clone_application/core/usecase/usecase.dart';
import 'package:spotify_clone_application/data/models/auth/create_user_request.dart';
import 'package:spotify_clone_application/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either,CreateUserRequest>{
  @override
  Future<Either> call({CreateUserRequest ? params}) async{
   return await sl<AuthRepository>().signup(params!);
  }

}