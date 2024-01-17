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
      appBar: AppBar(
        title: "Edit your details".text.make(),
      ),
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //if data image url and controller path is empty then show this
              Stack(
                children: [
                  data['imageUrl'] == '' && controller.profileImagepath.isEmpty
                      ? Image.asset(
                          'assets/images/profile.png',
                          width: context.screenWidth * .4,
                          height: context.screenHeight * .22,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      //if data is not empty but controller is empty
                      : data['imageUrl'] != '' &&
                              controller.profileImagepath.isEmpty
                          ? Image.network(
                              data['imageUrl'],
                              width: context.screenWidth * .4,
                              height: context.screenHeight * .22,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          //if both are empty
                          : Image.file(
                              File(controller.profileImagepath.value),
                              width: context.screenWidth * .4,
                              height: context.screenHeight * .22,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        controller.changeImage(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xff4bb050),
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.changeImage(context);
                          },
                          icon: const Icon(
                            Icons.upload,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ).box.roundedFull.make(),
                    ),
                  )
                ],
              ),
              controller.profileImagepath.value.isNotEmpty
                  ? controller.isloadings.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Color(0xff4bb050)),
                        )
                      : SizedBox(
                          width: context.screenWidth * .4,
                          child: ourButton(
                            color: const Color(0xff4bb050),
                            onPress: () async {
                              controller.isloadings(true);
                              if (controller
                                  .profileImagepath.value.isNotEmpty) {
                                await controller.uploadProfileImage();
                              } else {
                                controller.profileImageLink = data['imageUrl'];
                              }
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
                                    password:
                                        controller.newpassController.text);
                                VxToast.show(context, msg: "Updated Complete");
                                Get.back();
                              } else if (controller
                                      .oldpassController.text.isEmptyOrNull &&
                                  controller
                                      .newpassController.text.isEmptyOrNull) {
                                await controller.updateProfileDocument(
                                    imgUrl: controller.profileImageLink,
                                    name: controller.nameController.text,
                                    password: data['password']);
                                VxToast.show(context, msg: "Updated Complete");
                                Get.back();
                              } else {
                                VxToast.show(context,
                                    msg: "wrong old password");
                                controller.isloadings(false);
                              }
                            },
                            textcolor: Colors.white,
                            title: "save",
                          ),
                        )
                  : Container(),
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
                title: "New password",
                isPass: true,
              ),
              20.heightBox,
              controller.isloading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Color(0xff4bb050)),
                    )
                  : SizedBox(
                      width: context.screenWidth * .6,
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
              10.heightBox,
            ],
          )
              .box
              .white
              .shadow
              .rounded
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 15, left: 15, right: 15))
              .make(),
        ),
      ),
    );
  }
}
