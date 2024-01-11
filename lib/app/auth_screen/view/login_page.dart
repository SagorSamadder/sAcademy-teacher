// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/auth_controller.dart';
import '../../../general/common_widgets/coustom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  bool isSecurepassword = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/learning.png",
                  height: context.screenHeight * .22,
                  width: context.screenWidth * .60,
                ).box.alignCenter.make(),
                "Sign in to your account".text.size(28).make(),
                coustomtextfield(
                  controller: controller.namecontroller,
                  hint: "Enter your Name",
                  title: "Name",
                  isPass: false,
                  validator: controller.validname,
                ),
                coustomtextfield(
                  controller: controller.emailcontroller,
                  hint: "Enter your Email",
                  title: "Phone number or Email",
                  isPass: false,
                  validator: controller.validname,
                ),
                coustomtextfield(
                  controller: controller.passwordcontroller,
                  hint: "********",
                  title: "Password",
                  isPass: true,
                  validator: controller.validname,
                ),
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      value: isCheck,
                      onChanged: (newvalue) {
                        setState(() {
                          isCheck = newvalue;
                        });
                      },
                    ),
                    "Remember me".text.make()
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: context.screenWidth - 60,
                  child: controller.isloading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF134668)),
                          onPressed: () async {
                            controller.loginMethod(context: context);
                          },
                          child: controller.isloading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : "Sign in".text.white.make(),
                        ),
                ),
                15.heightBox,
                "Forgot the password?".text.size(16).make(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Don’t have an account?".text.size(16).make(),
                    5.widthBox,
                    TextButton(
                      onPressed: () {},
                      child: "Contact us".text.color(Colors.green).make(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget togglepassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecurepassword = !isSecurepassword;
        });
      },
      icon: isSecurepassword
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      color: Colors.grey,
    );
  }
}
