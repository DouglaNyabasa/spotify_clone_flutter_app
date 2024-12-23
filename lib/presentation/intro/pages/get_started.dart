import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_application/core/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone_application/core/configurations/assets/app_images.dart';
import 'package:spotify_clone_application/core/configurations/assets/app_vectors.dart';
import 'package:spotify_clone_application/core/configurations/theme/app_colors.dart';
import 'package:spotify_clone_application/presentation/choose_mode/pages/choose_mode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                  image: AssetImage(AppImages.introBG))
            ),


          ),
          Container(
            color: Colors.black.withOpacity(0.15),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                        AppVectors.logo
                    ),
                  ),
                  Spacer(),
                  Text("Enjoy Listening To Your Top PlayList", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 18),
                  ),
                  SizedBox(height: 21,),
                  Text("Get Access to your favourite music picks you are one click away free of charge and unlimited streaming", style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.grey,fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 21,),
                  BasicAppButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context)=> const ChooseMode()));
                      },
                      title: "Get Started")

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
