import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone_application/core/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone_application/core/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone_application/core/configurations/assets/app_vectors.dart';
import 'package:spotify_clone_application/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signUpText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 30,
          width: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            SizedBox(height: 10,),

            _emailField(context),
            SizedBox(height: 20,),
            _passwordField(context),
            SizedBox(height: 20,),
            BasicAppButton(onPressed: (){},
                title: 'Sign in')
          ],
        ),
      ),
    );
  }

  Widget _registerText(){
    return const Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }







  Widget _emailField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',

      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Password',

      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signUpText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an Account?',style:
          TextStyle(fontWeight: FontWeight.w500,fontSize: 14, ),
          ),

          TextButton(onPressed: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(
                    builder: (BuildContext context)=>  SignupPage()));
          },
              child: Text(
                  'Register Now '
              ))
        ],
      ),
    );
  }
}
