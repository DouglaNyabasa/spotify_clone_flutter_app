import 'package:get_it/get_it.dart';
import 'package:spotify_clone_application/data/repository/auth/auth_repository_impl.dart';

import 'data/sources/auth/auth_firebase_service.dart';
import 'domain/repository/auth/auth.dart';
import 'domain/usecases/authentication/signup.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  sl.registerSingleton<AuthFirebaseService>(
      AuthFirebaseServiceImpl()
  );
  //
  // sl.registerSingleton<SongFirebaseService>(
  //     SongFirebaseServiceImpl()M
  // );


  sl.registerSingleton<AuthRepository>(
      AuthenticationRepositoryImpl()
  );
  //
  // sl.registerSingleton<SongsRepository>(
  //     SongRepositoryImpl()
  // );



  sl.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );

  // sl.registerSingleton<SigninUseCase>(
  //     SigninUseCase()
  // );
  //
  // sl.registerSingleton<GetNewsSongsUseCase>(
  //     GetNewsSongsUseCase()
  // );
  //
  // sl.registerSingleton<GetPlayListUseCase>(
  //     GetPlayListUseCase()
  // );
  //
  // sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
  //     AddOrRemoveFavoriteSongUseCase()
  // );
  //
  // sl.registerSingleton<IsFavoriteSongUseCase>(
  //     IsFavoriteSongUseCase()
  // );
  //
  // sl.registerSingleton<GetUserUseCase>(
  //     GetUserUseCase()
  // );
  //
  // sl.registerSingleton<GetFavoriteSongsUseCase>(
  //     GetFavoriteSongsUseCase()
  // );

}