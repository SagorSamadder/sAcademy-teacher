import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../general/services/firebase_services.dart';

class DrawerHeaders extends StatelessWidget {
  const DrawerHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent.withOpacity(0.8),
      child: StreamBuilder(
        stream:
            FirestoreServices.getUser(FirebaseAuth.instance.currentUser!.uid),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          } else {
            var data = snapshot.data!.docs[0];

            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      data['imageUrl'] == ''
                          ? Image.asset(
                              "assets/images/user.png",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.network(
                              data['imageUrl'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                      15.widthBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data['name']}",
                              style: const TextStyle(fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${data['email']}",
                              style: const TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${data['phone']}",
                              style: const TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
