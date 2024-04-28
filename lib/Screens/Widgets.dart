import 'package:e_commerce_os/Models/CartProdectModel.dart';
import 'package:e_commerce_os/Models/ProdectModel.dart';
import 'package:e_commerce_os/Models/payment_intent_input_model.dart';
import 'package:e_commerce_os/Screens/Daetilas.dart';
import 'package:e_commerce_os/Screens/LoginScreen.dart';
import 'package:e_commerce_os/Screens/ThanksViwe.dart';
import 'package:e_commerce_os/ViewModel/Auth_ViewModel.dart';
import 'package:e_commerce_os/core/Constans/Colors.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:e_commerce_os/ViewModel/Controller_ViewModle.dart';
import 'package:get/get.dart';

class GetBuilderCurvedNavigationBar extends GetWidget<ControllerViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerViewModel>(
      init: Get.find(),
      builder: (controller) {
        return CurvedNavigationBar(
          animationDuration: Duration(seconds: 1),
          backgroundColor: Colors.white,
          color: ColorManager.primary,
          onTap: (index) {
            controller.getNavValue(index);
          },
          index: controller.navValue,
          items: [
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Colors.black),
              label: "explore",
              child: Icon(
                Icons.explore,
                color: Colors.black,
              ),
            ),
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Colors.black),
              label: "Card",
              child: Icon(
                Icons.card_travel,
                color: Colors.black,
              ),
            ),
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Colors.black),
              label: "person",
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}

class CircaleAvatarToShowPic extends StatelessWidget {
  const CircaleAvatarToShowPic({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: ColorManager.primary,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://firebasestorage.googleapis.com/v0/b/ecommerc-og.appspot.com/o/Image.png?alt=media&token=ee8ca2d6-bdbf-485e-bb59-78604372cba8",
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ContainerToShowDaetilasUserModel extends StatelessWidget {
  const ContainerToShowDaetilasUserModel({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .07,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.lightPrimary.withOpacity(.4),
                  Colors.white,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "E-mail: ",
                  style: getBoldTextStyle(
                    Colors.black,
                    context: context,
                  ),
                ),
                Text(
                  "${controller.userModel.email}",
                  style: getBoldTextStyle(
                    Colors.black,
                    context: context,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * .07,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.lightPrimary.withOpacity(.4),
                  Colors.white,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name: ",
                  style: getBoldTextStyle(
                    Colors.black,
                    context: context,
                  ),
                ),
                Text(
                  "${controller.userModel.name}",
                  style: getBoldTextStyle(
                    Colors.black,
                    context: context,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * .07,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.primary,
                  ColorManager.lightPrimary.withOpacity(.4),
                  Colors.white,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "UserId: ",
                  style: getBoldTextStyle(
                    Colors.black,
                    context: context,
                  ),
                ),
                Text(
                  "${controller.userModel.userId}",
                  style: getBoldTextStyle(
                    fontSize: 12,
                    Colors.black,
                    context: context,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   height: MediaQuery.sizeOf(context).height * .07,
          //   width: MediaQuery.sizeOf(context).width,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         ColorManager.primary,
          //         ColorManager.primary,
          //         ColorManager.primary,
          //         ColorManager.primary,
          //         ColorManager.lightPrimary.withOpacity(.4),
          //         Colors.white,
          //       ],
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Pic: ",
          //         style: getBoldTextStyle(
          //           Colors.black,
          //           fontSize: 20,
          //         ),
          //       ),
          //       Container(
          //         height: 200,
          //         width: 200,
          //         // child: Image.network(
          //           // "${controller.userModel.pic}",
          //           // style: getBoldTextStyle(
          //           //   Colors.black,
          //           //   fontSize: 18,
          //           // ),
          //         // ),
          // ),
          // ],
          // ),
          // ),
        ],
      ),
    );
  }
}

class ElevatedButtonsignOut extends StatelessWidget {
  const ElevatedButtonsignOut({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width * .7,
            MediaQuery.sizeOf(context).height * .05,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 255, 234, 0),
        ),
        iconColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      onPressed: () {
        controller.signOut();

        Get.offAll(
          LoginViwe(),
        );
      },
      icon: Icon(
        Icons.sign_language_outlined,
      ),
      label: Text(
        "signOut",
        style: getMediumTextStyle(
          Colors.black,
          context: context,
        ),
      ),
    );
  }
}

class GetBuilderTwoWaysToPay extends StatelessWidget {
  const GetBuilderTwoWaysToPay({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .1,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.picList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              controller.changeActiveIndex(index);
            },
            child: WayPayMant(
              activeIndex: controller.activeIndex == index,
              image: controller.picList[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width * .2,
          );
        },
      ),
    );
  }
}

class GetBuilderCreditCardWidget extends StatelessWidget {
  const GetBuilderCreditCardWidget({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      animationDuration: Duration(milliseconds: 500),
      cardBgColor: Colors.black,
      isHolderNameVisible: true,
      chipColor: ColorManager.primary,
      cardNumber: controller.cardNumber,
      expiryDate: controller.expiryDate,
      cardHolderName: controller.cardHolderName,
      cvvCode: controller.cvvCode,
      showBackView: controller.showBackView,
      onCreditCardWidgetChange: (value) {},
    );
  }
}

class GetBuilderCreditCardForm extends StatelessWidget {
  const GetBuilderCreditCardForm({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return CreditCardForm(
      autovalidateMode: controller.autoValidateMode,
      cardNumber: controller.cardNumber,
      expiryDate: controller.expiryDate,
      cardHolderName: controller.cardHolderName,
      cvvCode: controller.cvvCode,
      onCreditCardModelChange: (CreditCardModel) {
        controller.changeCreditCardNumber(CreditCardModel);
      },
      formKey: controller.formKey,
    );
  }
}

// class GetBuilderElevatedButton extends StatelessWidget {
//   const GetBuilderElevatedButton({
//     super.key,
//     required this.controller,
//   });
//   final controller;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         minimumSize: MaterialStatePropertyAll<Size>(
//           Size(
//             MediaQuery.sizeOf(context).width * .7,
//             MediaQuery.sizeOf(context).height * .05,
//           ),
//         ),
//         backgroundColor: MaterialStatePropertyAll(
//           Color.fromARGB(255, 255, 234, 0),
//         ),
//       ),
//       onPressed: () {
//         if (controller.formKey.currentState!.validate()) {
//           controller.formKey.currentState!.save();

//           controller.makePayment();
//           Get.to(
//             () => ThanksViwe(),
//             transition: Transition.fadeIn,
//           );
//         } else {
//           controller.changeAutoValidateMode();
//         }
//       },
//       child: Text(
//         "Cheek Out",
//         style: getMediumTextStyle(Colors.black),
//       ),
//     );
//   }
// }

class WayPayMant extends StatelessWidget {
  const WayPayMant({
    super.key,
    required this.image,
    required this.activeIndex,
  });
  final String image;
  final bool activeIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.sizeOf(context).height * .1,
      width: MediaQuery.sizeOf(context).width * .35,
      decoration: BoxDecoration(
        border: activeIndex
            ? Border.all(color: ColorManager.primary, width: 3)
            : Border.all(color: Colors.white),
        borderRadius: activeIndex
            ? BorderRadius.all(
                Radius.circular(
                  15,
                ),
              )
            : BorderRadius.all(
                Radius.circular(
                  0,
                ),
              ),
      ),
      duration: Duration(milliseconds: 275),
      child: Image.asset(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        image,
        filterQuality: FilterQuality.high,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

class ElevatedButtonSignInWithEmailAndPassword extends StatelessWidget {
  const ElevatedButtonSignInWithEmailAndPassword({
    super.key,
    required this.formkey,
    required this.controller,
  });

  final GlobalKey<FormState> formkey;
  final AuthViewModel controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height * .09,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 255, 234, 0),
        ),
      ),
      onPressed: () {
        formkey.currentState!.save();
        if (formkey.currentState!.validate()) {
          try {
            controller.signInWithEmailAndPassword();
          } on Exception catch (e) {
            print(e);
          }
        }
      },
      child: Text(
        "Sign In",
        style: getMediumTextStyle(
          Colors.black,
          context: context,
        ),
      ),
    );
  }
}

class ElevatedButtonSignInWithGoogle extends StatelessWidget {
  const ElevatedButtonSignInWithGoogle({
    super.key,
    required this.controller,
  });

  final AuthViewModel controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height * .09,
          ),
        ),
        backgroundColor:
            MaterialStatePropertyAll(Color.fromARGB(255, 255, 234, 0)),
      ),
      onPressed: () {
        controller.googleSignInFun();
      },
      child: Text(
        "sign in with Google",
        style: getMediumTextStyle(
          Colors.black,
          context: context,
        ),
      ),
    );
  }
}

class ContainerOfCategoiesInApp extends StatelessWidget {
  const ContainerOfCategoiesInApp({super.key, required this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoryModel.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(clipBehavior: Clip.none, children: [
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: ColorManager.primary,
                      child: CircleAvatar(
                        child: Image.network(
                          controller.categoryModel[index].image,
                        ),
                        radius: 30,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ]),
                  Text(
                    "${controller.categoryModel[index].name}",
                    style: getRegulerTextStyle(
                      Colors.black,
                      context: context,
                    ),
                  ),
                ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width * .1,
          );
        },
      ),
    );
  }
}

class ContainerOfItemsInApp extends StatelessWidget {
  const ContainerOfItemsInApp({
    super.key,
    required this.controller,
  });
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .3,
      child: Container(
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          itemCount: controller.productModel.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => Daetilas(
                      model: controller.productModel[index],
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 0,
                      offset: Offset(
                        50,
                        50,
                      ),
                    ),
                  ],
                ),
                child: Card(
                  color: ColorManager.primary,
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Hero(
                          tag: controller.productModel[index],
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * .15,
                            width: MediaQuery.sizeOf(context).width * .7,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "${controller.productModel[index].image}",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "${controller.productModel[index].name}",
                        style: getLightTextStyle(
                          Colors.black,
                          context: context,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            r"$"
                            "${controller.productModel[index].price}",
                            style: getLightTextStyle(
                              Colors.black,
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ContainerOfAllDe extends StatelessWidget {
  const ContainerOfAllDe({
    super.key,
    required this.model,
    required this.controller,
  });

  final ProductModel model;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      height: MediaQuery.sizeOf(context).height * .6,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${model.name}",
                style: getBoldTextStyle(
                  Colors.black,
                  context: context,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "price",
                  style: getBoldTextStyle(
                    Colors.black,
                    context: context,
                  ),
                ),
                Text(
                  "${model.price}",
                  style: getMediumTextStyle(
                    Colors.black,
                    context: context,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Color:",
                        style: getBoldTextStyle(
                          Colors.black,
                          context: context,
                        ),
                      ),
                      Text(
                        "${model.color}",
                        style: getMediumTextStyle(
                          Colors.black,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellowAccent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Size",
                        style: getBoldTextStyle(
                          Colors.black,
                          context: context,
                        ),
                      ),
                      Text(
                        "${model.size}",
                        style: getMediumTextStyle(
                          Colors.black,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Details",
                    style: getBoldTextStyle(
                      Colors.black,
                      context: context,
                    ),
                  ),
                  Text(
                    "${model.details}",
                    style: getMediumTextStyle(
                      Colors.black,
                      context: context,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButtonDecrease(
                  controller: controller,
                ),
                Text(
                  "${controller.quantity}",
                ),
                ElevatedButtonIncrease(
                  controller: controller,
                ),
                ElevatedButtonSaveDataLocal(
                  model: model,
                  controller: controller,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedButtonSaveDataLocal extends StatelessWidget {
  const ElevatedButtonSaveDataLocal({
    super.key,
    required this.model,
    required this.controller,
  });

  final ProductModel model;
  final controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width * .3,
            MediaQuery.sizeOf(context).height * .05,
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(color: Colors.black),
        ),
        iconColor: MaterialStatePropertyAll(Colors.black),
        backgroundColor: MaterialStatePropertyAll(
          ColorManager.primary,
        ),
      ),
      onPressed: () {
        if (controller.quantity > 0) {
          controller.saveDataLocal(
            CartProductModel(
                name: model.name,
                image: model.image,
                color: model.color,
                size: model.size,
                price: model.price,
                details: model.details,
                quan: controller.quantity),
          );
          controller.getTotalPriceForAllItem(controller.quantity * model.price);
          Get.showSnackbar(GetSnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: Colors.green,
            title: "Added To Card",
            message: "${controller.quantity * model.price} Itms Added To Card",
          ));
        } else {
          Get.showSnackbar(GetSnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            title: "Add To Card",
            message: "the Quantity is 0 and it is must be greater than 0 ",
            snackStyle: SnackStyle.GROUNDED,
          ));
        }
      },
      child: Text(
        "Add To Card",
        style: getMediumTextStyle(
          Colors.black,
          context: context,
        ),
      ),
    );
  }
}

class ElevatedButtonIncrease extends StatelessWidget {
  const ElevatedButtonIncrease({
    super.key,
    required this.controller,
  });
  final controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width * .05,
            MediaQuery.sizeOf(context).height * .05,
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(color: Colors.black),
        ),
        iconColor: MaterialStatePropertyAll(Colors.black),
        backgroundColor: MaterialStatePropertyAll(
          ColorManager.primary,
        ),
      ),
      onPressed: () {
        controller.increase();
      },
      child: Text(
        "+",
        style: getMediumTextStyle(
          Colors.black,
          context: context,
        ),
      ),
    );
  }
}

class ElevatedButtonDecrease extends StatelessWidget {
  const ElevatedButtonDecrease({
    super.key,
    required this.controller,
  });
  final controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width * .05,
            MediaQuery.sizeOf(context).height * .05,
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(color: Colors.black),
        ),
        iconColor: MaterialStatePropertyAll(Colors.black),
        backgroundColor: MaterialStatePropertyAll(
          ColorManager.primary,
        ),
      ),
      onPressed: () {
        controller.decrease();
      },
      child: Text(
        "-",
        style: getMediumTextStyle(
          Colors.black,
          context: context,
        ),
      ),
    );
  }
}

class HeroPic extends StatelessWidget {
  const HeroPic({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: model,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * .4,
        child: Image.network(
          fit: BoxFit.cover,
          model.image,
        ),
      ),
    );
  }
}

// class ElevatedButtonToPayWithCredtCard extends StatelessWidget {
//   const ElevatedButtonToPayWithCredtCard({
//     super.key,
//     required this.controller,
//   });
//   final controller;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         minimumSize: MaterialStatePropertyAll<Size>(
//           Size(
//             MediaQuery.sizeOf(context).width * .7,
//             MediaQuery.sizeOf(context).height * .05,
//           ),
//         ),
//         backgroundColor: MaterialStatePropertyAll(
//           Color.fromARGB(255, 255, 234, 0),
//         ),
//       ),
//       onPressed: () {
//         if (controller.activeIndex == 1) {
//           // if (controller.formKey.currentState!.validate()) {
//           // controller.formKey.currentState!.save();
//           controller
//               .makePayment(
//             paymentIntentInputModel: PaymentIntentInputModel(
//               amount: "${controller.finalPrice}00",
//               currency: "USD",
//             ),
//           )
//               .then((value) {
//             controller.clearAllThingsAfterPaymentSuccess();
//             Get.to(
//               () => ThanksViwe(),
//               transition: Transition.fadeIn,
//             );
//           });
//         } else if (controller.activeIndex == 0) {
//           controller.makePaymentWithPaypal(context: context);
//           print(controller.activeIndex);
//         } else {
//           controller.changeAutoValidateMode();
//           // }
//         }
//       },
//       child: Text(
//         "Pay Now With Credit Card",
//         style: getMediumTextStyle(
//           Colors.black,
//           context: context,
//         ),
//       ),
//     );
//   }
// }

class ElevatedButtonToPay extends StatelessWidget {
  const ElevatedButtonToPay({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width * .7,
            MediaQuery.sizeOf(context).height * .05,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 255, 234, 0),
        ),
      ),
      onPressed: () {
        if (controller.activeIndex == 1) {
          // controller
          //     .makePayment(
          //   paymentIntentInputModel: PaymentIntentInputModel(
          //     amount: "${controller.finalPrice}00",
          //     currency: "USD",
          //   ),
          // )
          controller
              .makePaymentWithCreditCard(
            paymentIntentInputModel: PaymentIntentInputModel(
              amount: "${controller.finalPrice}00",
              currency: "USD",
            ),
          )
              .then((value) {
            controller.clearAllThingsAfterPaymentSuccess();
            Get.to(
              () => ThanksViwe(),
              transition: Transition.fadeIn,
            );
          });
        } else if (controller.activeIndex == 0) {
          controller.makePaymentWithPaypal(context: context);
          controller.clearAllThingsAfterPaymentSuccess();
        } else {
          controller.changeAutoValidateMode();
          // }
        }
      },
      child: Text(
        controller.activeIndex == 0
            ? "Pay Now With PayPal"
            : "Pay Now With Credit Card",
        style: getMediumTextStyle(
          Colors.black,
          context: context,
        ),
      ),
    );
  }
}
