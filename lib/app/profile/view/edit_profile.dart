// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:edgefly_academy_admin/app/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../general/common_widgets/our_button.dart';
import '../../auth/component/coustom_textfield.dart';
import '../controller/profile_controller.dart';

class EditProfilescreen extends StatelessWidget {
  final dynamic data;
  const EditProfilescreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //if data image url and controller path is empty then show this
              data['imageUrl'] == '' && controller.profileImagepath.isEmpty
                  ? Image.asset(
                      'assets/images/profile.png',
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  //if data is not empty but controller is empty
                  : data['imageUrl'] != '' &&
                          controller.profileImagepath.isEmpty
                      ? Image.network(data['imageUrl'],
                              width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      //if both are empty
                      : Image.file(
                          File(controller.profileImagepath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              ourButton(
                  color: const Color(0xff4bb050),
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textcolor: Colors.white,
                  title: "Change image"),
              const Divider(),

              coustomtextfield(
                controller: controller.nameController,
                hint: "Your name",
                title: 'Name',
                isPass: false,
              ),
              5.heightBox,
              coustomtextfield(
                controller: controller.oldpassController,
                hint: "your old password",
                title: 'Oldpass',
                isPass: true,
              ),
              10.heightBox,
              coustomtextfield(
                controller: controller.newpassController,
                hint: "Your new password",
                title: "Newpassword",
                isPass: true,
              ),
              20.heightBox,
              controller.isloading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Color(0xff4bb050)),
                    )
                  : SizedBox(
                      width: context.screenWidth - 80,
                      child: ourButton(
                          color: const Color(0xff4bb050),
                          onPress: () async {
                            controller.isloading(true);

                            //if image is not selected
                            if (controller.profileImagepath.value.isNotEmpty) {
                              await controller.uploadProfileImage();
                            } else {
                              controller.profileImageLink = data['imageUrl'];
                            }

                            //if old password math the database password
                            if (data['password'] ==
                                controller.oldpassController.text) {
                              await controller.changeAuthpassword(
                                  email: data['email'],
                                  password: controller.oldpassController.text,
                                  newpassword:
                                      controller.newpassController.text);
                              await controller.updateProfileDocument(
                                  imgUrl: controller.profileImageLink,
                                  name: controller.nameController.text,
                                  password: controller.newpassController.text);
                              VxToast.show(context, msg: "Updated Complete");
                              Get.offAll(() => const HomeScreen());
                            } else if (controller
                                    .oldpassController.text.isEmptyOrNull &&
                                controller
                                    .newpassController.text.isEmptyOrNull) {
                              await controller.updateProfileDocument(
                                  imgUrl: controller.profileImageLink,
                                  name: controller.nameController.text,
                                  password: data['password']);
                              VxToast.show(context, msg: "Updated Complete");
                              Get.offAll(() => const HomeScreen());
                            } else {
                              VxToast.show(context, msg: "wrong old password");
                              controller.isloading(false);
                            }
                          },
                          textcolor: Colors.white,
                          title: "save"),
                    ),
            ],
          )
              .box
              .white
              .shadow
              .rounded
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 15, right: 15))
              .make(),
        ),
      ),
    );
  }
}
