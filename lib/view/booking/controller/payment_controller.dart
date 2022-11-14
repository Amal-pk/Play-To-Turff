import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:turf_app/view/booking/controller/controller.dart';
import 'package:turf_app/view/bottom_navigation/view/bottom_navigation.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';

class PaymentController extends ChangeNotifier {
  BookinController controller = BookinController();


  late Datum datum;
  dynamic context;
  Razorpay razorpay = Razorpay();
  // void oninit() {
  //   razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  // }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   controller.continueBooking( datum, context);
  //   Get.offAll(() => BottomNavigation());
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {}

  // void _handleExternalWallet(ExternalWalletResponse response) {}

  // @override
  // void dispose() {
  //   super.dispose();

  //   razorpay.clear();
  // }

  // razorpayOption(int totalPrice, Datum data ,context) {
  
  //   datum = data;
  //   context = context;
  //   var options = {
  //     'key': 'rzp_test_JoO24Z2D1yYvCF',
  //     'amount': totalPrice * 100, //in the smallest currency sub-unit.
  //     'name': 'Amal.',
  //     // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
  //     'description': 'Turf',
  //     'timeout': 60, // in seconds
  //     'prefill': {'contact': '8606586632', 'email': 'amalpkdrv@gmail.com'}
  //   };
  //   razorpay.open(options);
  // }
}
