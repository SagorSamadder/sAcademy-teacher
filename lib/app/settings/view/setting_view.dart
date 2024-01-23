import 'package:edgefly_academy_admin/app/auth/view/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/drawer/drawer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var switchnewvalue = true;
  var darkmodevalu = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3877c8),
        title: const Text('setting screen'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff3777c8),
              Color.fromARGB(255, 89, 215, 247),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(),
                ),
                child: ListTile(
                  title: "Notifications".text.make(),
                  trailing: Switch(
                      value: switchnewvalue,
                      onChanged: (value) {
                        setState(() {
                          switchnewvalue = value;
                        });
                      }),
                ),
              ),
              10.heightBox,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(),
                ),
                child: ListTile(
                  title: "Dark mode".text.make(),
                  trailing: Switch(
                      value: darkmodevalu,
                      onChanged: (value) {
                        setState(() {
                          darkmodevalu = value;
                        });
                      }),
                ),
              ),
              10.heightBox,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(),
                ),
                child: ListTile(
                  title: "Contuct us".text.make(),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.call)),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.offAll(() => const SigninScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      10.widthBox,
                      const Text(
                        "Log out",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              50.heightBox,
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
