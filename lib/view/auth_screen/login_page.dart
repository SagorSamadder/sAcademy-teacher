// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/auth_controller.dart';
import '../home_screen/home_screen.dart';
import 'component/coustom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  bool isSecurepassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                controller: controller.emailcontroller,
                hint: "Enter your Email",
                title: "Phone number or Email",
                isPass: false,
              ),
              coustomtextfield(
                controller: controller.passwordcontroller,
                hint: "********",
                title: "Password",
                isPass: true,
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
                          controller.isloading(true);
                          try {
                            final loginResult =
                                await controller.loginMethod(context: context);

                            if (loginResult != null) {
                              await controller.storeUserData(
                                email: controller.emailcontroller.value.text,
                                password:
                                    controller.passwordcontroller.value.text,
                              );
                              VxToast.show(context, msg: "login successed");
                              controller.isloading(false);
                              Get.offAll(() => const HomeScreen());
                            } else {
                              controller.isloading(false);
                            }
                          } catch (e) {
                            // Handle any errors that occur during login or data storage
                            VxToast.show(context, msg: "$e");
                            controller.isloading(false);
                          }
                        },
                        child: "Sign in".text.white.make(),
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
