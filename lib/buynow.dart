import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class buynow extends StatefulWidget {
  const buynow({Key? key}) : super(key: key);

  @override
  State<buynow> createState() => _buynowState();
}

class _buynowState extends State<buynow> {

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  String name = "boAt Wave Lite Smartwatch ";
  int price = 1599;
  String details = "'1.69' HD Display, Sleek Metal Body, HR & SpO2 Level Monitor, 140+ Watch Faces, Activity Tracker, Multiple Sports Modes, IP68 & 7 Days Battery Life(Active Black)";

  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase Product"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image(height: MediaQuery.of(context).size.height * 0.4,width: double.infinity,
                image: NetworkImage(
                    "https://images-eu.ssl-images-amazon.com/images/I/41qAgAkiXjL._SX300_SY300_QL70_FMwebp_.jpg"),fit: BoxFit.contain,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${price}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(details),
                  ),

                  ElevatedButton(onPressed: () {

                    openCheckout();

                  }, child: Text("Buy Now"))
          ],
        ),
      ),
    );
  }
  void openCheckout() async {

    int netamount = price*100;

    var options = {
      'key': 'rzp_test_aF0RJ5mFaBwg6v',
      'amount': netamount,
      'name': name,
      'description': details,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: ${response.orderId}${response.paymentId}');
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: ${response.message}');
     Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
     Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

}

