import 'package:e_commerce_os/core/Constans/Colors.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';

class ThanksViwe extends StatelessWidget {
  const ThanksViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // color: ColorManager.primary,
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        // child: Padding(
        // padding: EdgeInsets.(20.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .8,
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    border: Border.all(
                      color: ColorManager.primary,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        40,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 200,
                  left: -25,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 200,
                  right: -25,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 590,
                  right: 123,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: ColorManager.primary,
                  ),
                ),
                Positioned(
                  bottom: 600,
                  right: 132,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.gpp_good,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 300,
                  right: 12,
                  child: Text(
                    "Your transaction was successful",
                    style: getBoldTextStyle(Colors.black, context: context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
