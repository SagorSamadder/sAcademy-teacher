import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edgefly_academy_admin/app/profile/controller/profile_controller.dart';
import 'package:edgefly_academy_admin/app/profile/view/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../general/consts/firebase_consts.dart';
import '../../widgets/drawer/drawer.dart';
import '../services/firebase_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: StreamBuilder(
          stream: FirestoreServicesProfile.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff4bb050),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  data['imageUrl'] == ''
                                      ? Image.asset(
                                          'assets/images/profile.png',
                                          width: context.screenWidth * .6,
                                          fit: BoxFit.cover,
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make()
                                      : Image.network(
                                          data['imageUrl'],
                                          width: context.screenWidth * .6,
                                          fit: BoxFit.cover,
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make(),
                                  5.widthBox,
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        "Name: ".text.size(18).white.make(),
                                        "${data['name']}".text.white.make(),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        "Email: ".text.size(18).white.make(),
                                        "${data['email']}".text.white.make(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 143, 255, 109),
                                      side: const BorderSide(
                                        color: Colors.white,
                                      )),
                                  onPressed: () {
                                    controller.nameController.text =
                                        data['name'];
                                    Get.to(() => EditProfilescreen(data: data));
                                  },
                                  child: const Icon(Icons.edit),
                                ),
                              ),
                              10.heightBox,
                            ],
                          ),
                        ),
                      )
                    ]),
              );
            }
          }),
      drawer: const MyDrawer(),
    );
  }
}
