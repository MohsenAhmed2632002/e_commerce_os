// ignore_for_file: must_be_immutable

import 'package:e_commerce_os/Models/ProdectModel.dart';
import 'package:e_commerce_os/ViewModel/DBViewModel.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Daetilas extends StatelessWidget {
  ProductModel model;
  Daetilas({required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .85,
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: model,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * .4,
                        child: Image.network(
                          fit: BoxFit.contain,
                          model.image,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .03,
                    ),
                    Text(
                      "${model.name}",
                      style: getBoldTextStyle(Colors.black),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          width: MediaQuery.sizeOf(context).width * .4,
                          height: MediaQuery.sizeOf(context).height * .04,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Color:",
                                style: getBoldTextStyle(Colors.black),
                              ),
                              Text(
                                "${model.color}",
                                style: getMediumTextStyle(Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          width: MediaQuery.sizeOf(context).width * .4,
                          height: MediaQuery.sizeOf(context).height * .04,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Size",
                                style: getBoldTextStyle(Colors.black),
                              ),
                              Text(
                                "${model.size}",
                                style: getMediumTextStyle(Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .05,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Details",
                            style: getBoldTextStyle(Colors.black),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .01,
                          ),
                          Text(
                            "${model.details}",
                            style: getMediumTextStyle(Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xFF00C569),
                // height: MediaQuery.sizeOf(context).height * .2,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "price",
                            style:
                                getRegulerTextStyle(lightColorScheme.onPrimary),
                          ),
                          Text(
                            "${model.price}",
                            style:
                                getMediumTextStyle(lightColorScheme.onPrimary),
                          ),
                        ],
                      ),
                      GetBuilder<CashData>(
                        builder: (controller) => TextButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              lightColorScheme.onPrimary,
                            ),
                          ),
                          onPressed: () {
                            controller.SetCartList(model.name);
                          },
                          icon: Icon(Icons.attach_money),
                          label: Text("BUY"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
