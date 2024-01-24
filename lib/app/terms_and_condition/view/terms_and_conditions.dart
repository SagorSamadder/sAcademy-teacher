import 'package:edgefly_academy_admin/app/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/strings.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Terms & Condition".text.make(),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Our terms & condition : "
                  .text
                  .bold
                  .fontWeight(FontWeight.w900)
                  .size(18)
                  .make(),
              10.heightBox,
              termsAndCondition.text.size(18).fontWeight(FontWeight.w500).make()
            ],
          ),
        ),
      ),
    );
  }
}
