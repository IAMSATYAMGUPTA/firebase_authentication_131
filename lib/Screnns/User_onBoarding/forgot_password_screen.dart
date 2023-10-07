import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Custom Widget/gradient_button.dart';
import '../../Custom Widget/textfeild_decoration.dart';
import '../../mixing/validator_mixin.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> with ValidatorMixin {

  var emailController = TextEditingController();
  bool isLoading = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage("assets/verifications_image/forgot.jpg")),
            SizedBox(height: 108,),

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

                        // Here i used Animated ForgotPassword Text
                        Row(
                          children: [
                            AnimatedTextKit(
                              totalRepeatCount: 2,
                              animatedTexts: [
                                TyperAnimatedText("ForgotPassword",
                                    speed: Duration(milliseconds: 50)
                                    ,textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 24))
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),

                        // user name Text Feild
                        TextFormField(
                          controller: emailController,
                          validator: emailValidate,
                          style: TextStyle(fontSize: 16),
                          decoration: TextFeildDecoration.getCustomDecoration(
                            labelText: "User Email ...",
                            hint: "email@gmail.com",
                            mSuffixIcon: Icons.email_outlined,
                            suffixcolor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),

            // Forgot password Button
            Row(
              children: [
                SizedBox(width: 20,),
                GradientButton(title: "Send Verification Link", width: 320.0, loading: isLoading,
                    onTab: (){
                      if(formKey.currentState !=null){
                        if(formKey.currentState!.validate()){

                        }
                      }
                    }
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
