import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_authentication_131/Screnns/User_onBoarding/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

import '../../Custom Widget/custom_toast.dart';
import '../../Custom Widget/gradient_button.dart';
import '../../Custom Widget/textfeild_decoration.dart';
import '../../mixing/validator_mixin.dart';
import 'forgot_password_screen.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> with ValidatorMixin {

  var _opacity = 0.0;

  final emailcController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 900), () {
      _opacity = 1.0;
      setState(() {

      });
    });
  }

  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: _opacity,
          child: Column(
            children: [
              Image(image: AssetImage("assets/verifications_image/verification.jpg")),
              SizedBox(height: 5,),
              Container(
                width: 330,
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),

                          // Here i used to Animated Login Text
                          Row(
                            children: [
                              AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText("Login",
                                        speed: Duration(milliseconds: 100)
                                        ,textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 24))
                                  ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),

                          // user name Text Feild
                          TextFormField(
                            validator: emailValidate,
                            controller: emailcController,
                            style: TextStyle(fontSize: 16),
                            decoration: TextFeildDecoration.getCustomDecoration(
                                labelText: "Email...",
                              hint: "email@gmail.com",
                                mSuffixIcon: Icons.email_outlined,
                                suffixcolor: Colors.green,

                            ),
                          ),
                          SizedBox(height: 22,),

                          // user Password Text Feild
                          TextFormField(
                            validator: passValidate,
                            controller: passwordController,
                            obscuringCharacter: "*",
                            obscureText: isPassword ? false:true,
                            decoration: TextFeildDecoration.getCustomDecoration(
                              labelText: "Password",
                              mSuffixIcon: isPassword ? Icons.visibility:Icons.visibility_off,
                              suffixcolor: Colors.green,
                              onSuffixIconTap: (){
                                setState(() {
                                  isPassword=!isPassword;
                                });
                              }
                            ),
                          ),
                          SizedBox(height: 13,),

                          // Used Forgot password Text
                          Align(alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: (){
                                    Navigator.push(context, PageTransition(
                                        type: PageTransitionType.rightToLeftWithFade,
                                        child: ForgotPasswordPage(),duration: Duration(seconds: 1)));
                                  },
                                  child: Text("Forgot password?",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600)))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              // In the used of Login Button I take Row
              Row(
                children: [
                  SizedBox(width: 188,),
                  GradientButton(loading: isLoading,title: "Login",
                      onTab: (){
                        if(formKey.currentState!=null){
                          if(formKey.currentState!.validate()){

                          }
                        }
                      }
                  ),
                ],
              ),
              SizedBox(height: 20,),

              // Social media account Icon
              Text("--------------------------Other Account--------------------------"),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 10,),
                  CircleAvatar(backgroundColor:Colors.green.shade800,child: FaIcon(FontAwesomeIcons.phone,color: Colors.white,size: 18,)),
                  FaIcon(FontAwesomeIcons.facebook,color: Colors.blue,size: 40,),
                  CircleAvatar(backgroundColor: Colors.red,child: FaIcon(FontAwesomeIcons.google,color: Colors.white,size: 18,)),
                  CircleAvatar(backgroundColor: Colors.blue,child: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 18)),
                  SizedBox(width: 10,),
                ],
              ),

              // Switch to SignupScreen Text
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New user? ",style: TextStyle(fontSize: 17),),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: SignupScreenPage(),
                            duration: Duration(milliseconds: 700)));},
                      child: Text("Signup",style: TextStyle(color: Colors.green,fontSize: 18),)),
                ],
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      )
      );
  }
}

// InkWell(
// onTap: (){
// // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPhoneNumber(),));
// },
// child: Container(
// height: 45,
// width: 300,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// border: Border.all(color: Colors.black)
// ),
// child: Center(
// child: Text("Login with phone",style: TextStyle(fontSize: 17),),
// ),
// ),
// ),
// SizedBox(height: 40,),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("New user? ",style: TextStyle(fontSize: 16),),
// Text("Signup",style: TextStyle(color: Colors.green,fontSize: 16),),
// ],
// ),


