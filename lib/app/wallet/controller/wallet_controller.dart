import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WalletController extends GetxController {
  RxInt accountBalance = 0.obs;

  Future<void> updateWallet(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference userRef = firestore.collection('users').doc(userId);

    DocumentSnapshot userSnapshot = await userRef.get();

    if (userSnapshot.exists) {
      bool status = userSnapshot['status'];

      if (status) {
        int currentBalance = userSnapshot['account'] ?? 0;
        int newBalance = currentBalance * 2;

        // Update the account balance in the controller
        accountBalance.value = newBalance;

        // Update the Firestore document
        await userRef.update({'account': newBalance});
      }
    }
  }
}
