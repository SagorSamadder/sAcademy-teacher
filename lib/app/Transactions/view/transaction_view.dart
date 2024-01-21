import 'dart:developer';

import 'package:edgefly_academy_admin/app/Transactions/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionController controller = Get.put(TransactionController());
    return Scaffold(
      backgroundColor: const Color(0xff4db6e7),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 160, 206),
        elevation: 2,
        title: "All transaction".text.white.bold.make(),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !controller.loadingMore.value) {
            // Fetch more data when the user reaches the end of the list
            controller.fetchMoreData();
            log("fetching more data");
          }
          return false;
        },
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            15.heightBox,
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: context.screenWidth * .05),
                child:
                    "All transaction history".text.white.size(20).bold.make(),
              ),
            ),
            10.heightBox,
            Obx(
              () => controller.transactionList.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            60.heightBox,
                            Text(
                              "You Don't have any transaction history",
                              style: TextStyle(
                                  fontSize: context.screenWidth * .06,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image.asset(
                              'assets/images/empty.png',
                              width: context.screenWidth * .7,
                            )
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.transactionList.length,
                      itemBuilder: (context, index) {
                        var questionData =
                            controller.transactionList[index].data();
                        return Container(
                          padding: const EdgeInsets.all(8),
                          margin: EdgeInsets.only(
                              left: context.screenWidth * .05,
                              right: context.screenWidth * .05,
                              bottom: context.screenWidth * .04),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                offset: Offset(2, 2),
                              )
                            ],
                          ),
                          child: ListTile(
                            onTap: () {},
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Amount: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: context.screenWidth * .012,
                                      ),
                                      Text(
                                        "${questionData['amount']}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            title: Row(
                              children: [
                                const Text(
                                  "Status:  ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${questionData['status']}",
                                  style: TextStyle(
                                    color: questionData['status'] == 'accepted'
                                        ? const Color.fromARGB(255, 6, 120, 219)
                                        : (questionData['status'] == 'pending'
                                            ? Colors.black
                                            : Colors.red),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Obx(
              () => Center(
                child: controller.loadingMore.value
                    ? const CircularProgressIndicator()
                    : null,
              ),
            ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
