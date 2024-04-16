import 'package:dio/dio.dart';
import 'package:e_commerce_os/Models/payment_intent_input_model.dart';
import 'package:e_commerce_os/Models/payment_intent_model/payment_intent_model.dart';
import 'package:e_commerce_os/Services/Api.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final Apiservice apiservice = Apiservice();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiservice.post(
        contentType: Headers.formUrlEncodedContentType,
        body: paymentIntentInputModel.toJson(),
        Url: "https://api.stripe.com/v1/payment_intents",
        token:
            "sk_test_51P5NxpRvDErjFj2ZlDAQiPXw6zn7Afp7vy4Qfvr6etDPQmwhWJf7z0VDFl2XUYCesERHFFCbgHK6HtJVgJsBqgNR00GhAdqogV");
    return PaymentIntentModel.fromJson(response.data);
  }

  Future initePaymentSheet(
      {required String paymentIntentClientSecret,
      required String merchantDisplayName}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: merchantDisplayName,
          paymentIntentClientSecret: paymentIntentClientSecret),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future startPayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initePaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      merchantDisplayName: "Mohsen Ahmed",
    );
    await displayPaymentSheet();
  }
}
