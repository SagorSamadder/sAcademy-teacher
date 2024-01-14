// ignore_for_file: file_names, use_build_context_synchronously
import 'package:edgefly_academy_admin/app/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../component/coustom_textfield.dart';
import '../controller/signup_controller.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  static String verify = "";

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool? isCheck = false;
  GlobalKey buttonKey = GlobalKey();
  String selectedValue = "ssc";
  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Registration".text.color(Colors.black87).make(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                coustomtextfield(
                  controller: controller.namecontroller,
                  hint: "Enter your full name",
                  title: "Full Name",
                  isPass: false,
                  validator: controller.validname,
                ),
                coustomtextfield(
                  controller: controller.emailcontroller,
                  hint: "Enter your Email",
                  title: "Email",
                  isPass: false,
                  validator: controller.validateemail,
                ),
                coustomtextfield(
                    controller: controller.phonecontroller,
                    hint: "Enter your phone",
                    title: "phone",
                    isPass: false,
                    validator: controller.validPhone),
                coustomtextfield(
                  controller: controller.passcontroller,
                  hint: "********",
                  title: "Password",
                  isPass: true,
                  validator: controller.validpass,
                ),
                coustomtextfield(
                  hint: "********",
                  title: "Confirm Password",
                  isPass: true,
                  validator: controller.validpass,
                ),
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xFF134668),
                      checkColor: Colors.white,
                      value: isCheck,
                      onChanged: (newvalue) {
                        setState(() {
                          isCheck = newvalue;
                        });
                      },
                    ),
                    "Terms & Condition".text.make()
                  ],
                ),
                10.heightBox,
                SizedBox(
                  width: context.screenWidth * .7,
                  height: 55,
                  child: Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCheck == true
                            ? const Color(0xFF134668)
                            : const Color.fromARGB(255, 86, 158, 206),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () async {
                        if (isCheck = false) {
                          VxToast.show(context,
                              msg: "make sure to agree our terms & conditon");
                          // ignore: unnecessary_null_comparison
                        } else if (selectedValue != null) {
                          await controller.signupUser(context);
                          if (controller.userCredential != null) {
                            Get.offAll(() => const HomeScreen());
                          }
                        } else {}
                      },
                      child: controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : "Registration".text.white.make(),
                    ),
                  ),
                ),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
