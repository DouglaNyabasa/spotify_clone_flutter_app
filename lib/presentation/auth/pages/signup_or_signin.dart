import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_application/core/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone_application/core/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone_application/core/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone_application/core/configurations/assets/app_images.dart';
import 'package:spotify_clone_application/core/configurations/assets/app_vectors.dart';
import 'package:spotify_clone_application/core/configurations/theme/app_colors.dart';
import 'package:spotify_clone_application/presentation/auth/pages/signin.dart';
import 'package:spotify_clone_application/presentation/auth/pages/signup.dart';

class SignupOrSignIn extends StatelessWidget {
  const SignupOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  SizedBox(height: 30,),
                  Text("Enjoy Listening To Music",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 20,),
                  Text("Spotify is a proprietary Swedish audio streaming and media service provider ",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.grey
                  ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                          child: BasicAppButton(
                              onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                  builder: (BuildContext context)=> const SignupPage()));
                  },
                              title: "Register")
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context)=> const SigninPage()));
                            },
                            child: Text("Sign in",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: context.isDarkMode ? Colors.white : Colors.black,
                            ),)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
