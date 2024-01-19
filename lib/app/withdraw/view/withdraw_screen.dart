import 'package:edgefly_academy_admin/app/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/withdraw_controller.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

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
              height: context.screenHeight * .6,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Your current ballance :"
                              .text
                              .size(18)
                              .semiBold
                              .make(),
                          10.widthBox,
                          "100 tk".text.make()
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: "Your password".text.make(),
                      ),
                      10.heightBox,
                      TextFormField(
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      20.heightBox,
                      SizedBox(
                        height: context.screenHeight * .07,
                        width: context.screenWidth * .55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff3777c8)),
                          onPressed: () {
                            controller.proceedWithdraw(context);
                            Get.offAll(const HomeScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.outbox,
                                color: Colors.white,
                              ),
                              5.widthBox,
                              const Text(
                                "Proceed",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight * .03,
                      ),
                    ],
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
