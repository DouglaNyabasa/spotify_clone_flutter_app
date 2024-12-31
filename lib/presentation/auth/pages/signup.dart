import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone_application/core/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone_application/core/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone_application/core/configurations/assets/app_vectors.dart';
import 'package:spotify_clone_application/data/models/auth/create_user_request.dart';
import 'package:spotify_clone_application/domain/usecases/authentication/signup.dart';
import 'package:spotify_clone_application/presentation/auth/pages/signin.dart';
import 'package:spotify_clone_application/presentation/root/pages/root.dart';

import '../../../service_locator.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signInText(context),
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
            _fullNameField(context),
            SizedBox(height: 20,),
            _emailField(context),
            SizedBox(height: 20,),
            _passwordField(context),
            SizedBox(height: 20,),
            BasicAppButton(onPressed: () async {
              var result = await  sl<SignupUseCase>().call(
                params: CreateUserRequest(
                    fullName: _fullName.text.toString(),
                    email: _email.text.toString(),
                    password: _password.text.toString())
              );
              result.fold(
                  (l){
                    var snackBar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
              , (r){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context)=> RootPage()),
                        (route) => false
                    );

              }
              );
            },
                title: 'Create Account')
          ],
        ),
      ),
    );
  }

  Widget _registerText(){
    return const Text(
      "Register",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }
  
  



  Widget _fullNameField(BuildContext context){
    return TextField(
      controller: _fullName,
      decoration: InputDecoration(
        hintText: 'Full Name',

      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _emailField(BuildContext context){
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: 'Enter Email',

      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      controller: _password,
      decoration: InputDecoration(
        hintText: 'Password',

      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  
  Widget _signInText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an Account?',style:
            TextStyle(fontWeight: FontWeight.w500,fontSize: 14, ),
          ),
          TextButton(onPressed: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(
                    builder: (BuildContext context)=> const SigninPage()));
          },
              child: Text(
                'Sign In '
              ))
        ],
      ),
    );
  }
}
