import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../home_screen/view/home_screen.dart';
import '../controller/withdraw_controller.dart';

class WithdrawScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  WithdrawScreen({super.key, this.data});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WithdrawController controller = Get.put(WithdrawController());
    return Scaffold(
      appBar: AppBar(
        title: "withdraw".text.white.make(),
        backgroundColor: const Color(0xff3777c8),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xfff0f5fa),
          ),
          Container(
            height: context.screenHeight * .4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff3777c8),
                  Color.fromARGB(255, 89, 215, 247),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Positioned(
            left: context.screenWidth * .05,
            top: 10,
            child: Container(
              height: context.screenHeight * .7,
              width: context.screenWidth * .89,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 199, 199, 199),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Your current ballance :"
                                .text
                                .size(18)
                                .semiBold
                                .make(),
                            10.widthBox,
                            "${data['account']} tk".text.size(18).make()
                          ],
                        ),
                        20.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: "Ammount".text.make(),
                        ),
                        10.heightBox,
                        TextFormField(
                          controller: controller.amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.balance),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter an ammount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Color(0xFF134668)),
                            ),
                          ),
                          validator: controller.validname,
                        ),
                        10.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: "Nogod or Bikash account".text.make(),
                        ),
                        10.heightBox,
                        TextFormField(
                          controller: controller.numberController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.balance),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter you account no',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Color(0xFF134668)),
                            ),
                          ),
                          validator: controller.validname,
                        ),
                        10.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: "Your password".text.make(),
                        ),
                        10.heightBox,
                        TextFormField(
                          controller: controller.passController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.balance),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  width: 2.0, color: Color(0xFF134668)),
                            ),
                          ),
                          validator: controller.validname,
                        ),
                        20.heightBox,
                        SizedBox(
                          height: context.screenHeight * .07,
                          width: context.screenWidth * .55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff3777c8)),
                            onPressed: () async {
                              //check user fill all documents
                              if (formkey.currentState!.validate()) {
                                //user account balance check
                                if (double.parse(data['account'].toString()) >=
                                    double.parse(
                                        controller.amountController.text)) {
                                  //passord checking
                                  if (data['password'] ==
                                      controller.passController.text) {
                                    await controller.proceedWithdraw(context);
                                    Get.offAll(() => const HomeScreen());
                                  } else {
                                    Get.showSnackbar(const GetSnackBar(
                                      title: "wrong password",
                                      message: "You entered a wrong password",
                                      snackPosition: SnackPosition.TOP,
                                      duration: Duration(seconds: 4),
                                      borderRadius: 20,
                                      backgroundColor:
                                          Color.fromARGB(255, 129, 129, 129),
                                      margin: EdgeInsets.all(10),
                                      boxShadows: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                        )
                                      ],
                                    ));
                                  }
                                } else {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: "Insufficient balance !",
                                    message: "You don't have enough balance",
                                    snackPosition: SnackPosition.TOP,
                                    duration: Duration(seconds: 4),
                                    borderRadius: 20,
                                    backgroundColor:
                                        Color.fromARGB(255, 129, 129, 129),
                                    margin: EdgeInsets.all(10),
                                    boxShadows: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3,
                                      )
                                    ],
                                  ));
                                }
                              } else {
                                Get.showSnackbar(const GetSnackBar(
                                  title: "Fill all documents",
                                  message:
                                      "fill all documents with valied data",
                                  snackPosition: SnackPosition.TOP,
                                  duration: Duration(seconds: 4),
                                  borderRadius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 129, 129, 129),
                                  margin: EdgeInsets.all(10),
                                  boxShadows: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3,
                                    )
                                  ],
                                ));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.outbox,
                                  color: Colors.white,
                                ),
                                5.widthBox,
                                controller.isloading.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text(
                                        "Proceed",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
