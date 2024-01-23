import 'package:edgefly_academy_admin/app/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../String/privacy_policy_string.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Privacy policy".text.make(),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Privacy Policy for Edgefly Academy',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Last Updated: 25 january 2024',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                thankyoutext,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.heightBox,
              "1. Information We Collect".text.bold.make(),
              5.heightBox,
              informationwecolllect1.text.make(),
              5.heightBox,
              informationcollect2.text.make(),
              10.heightBox,
              "2. Use of Collected Information".text.bold.make(),
              5.heightBox,
              useofinformation.text.make(),
              10.heightBox,
              "3. Data Security".text.bold.make(),
              5.heightBox,
              datasecurity.text.make(),
              10.heightBox,
              "4. Third-Party Services".text.bold.make(),
              5.heightBox,
              thirdpartysecurity.text.make(),
              10.heightBox,
              "5. Children's Privacy".text.bold.make(),
              5.heightBox,
              childrainSecurity.text.make(),
              10.heightBox,
              "6. Changes to this Privacy Policy".text.bold.make(),
              5.heightBox,
              changeprivacypolicy.text.make(),
              10.heightBox,
              "7. Contact Us".text.bold.make(),
              5.heightBox,
              contuctus.text.make(),
              10.heightBox,
              "By using Edgefly Academy, you agree to the terms outlined in this Privacy Policy."
                  .text
                  .fontWeight(FontWeight.w500)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
