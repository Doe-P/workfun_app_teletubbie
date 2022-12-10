// ignore_for_file: unused_local_variable, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:workfun_app_teletubbie/view/colors/colors.dart';
import 'package:workfun_app_teletubbie/view/style/text_style.dart';

import 'help_widget.dart';

class Dialogs {
  static Future successDialog(BuildContext context, String content) async {
    bool isLoading = false;
    var result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              backgroundColor: whiteColor,
              elevation: 2,
              insetAnimationDuration: const Duration(milliseconds: 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    IntrinsicHeight(
                      child: Column(
                        children: [
                          heightBox(20),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                                color: Color(0xff2ed573),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80))),
                            child: Icon(
                              Icons.done,
                              size: 36,
                              color: whiteColor,
                            ),
                          ),
                          heightBox(20),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  content,
                                  style: styleOption(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                alignment: const Alignment(0, 0),
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                              heightBox(20)
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: outlineButton(
                              () {
                                Navigator.pop(context, true);
                              },
                              Text(
                                'ສຳເລັດ',
                                style: styleOption(),
                              ),
                              whiteColor,
                              blackColor,
                              1.0,
                              50.0,
                              const EdgeInsets.fromLTRB(50, 10, 50, 10),
                            ),
                          ),
                          heightBox(20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });

    return result;
  }

  static Future errorDialog(BuildContext context, String content) async {
    bool isLoading = false;
    var result = await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              backgroundColor: whiteColor,
              elevation: 2,
              insetAnimationDuration: const Duration(milliseconds: 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    IntrinsicHeight(
                      child: Column(
                        children: [
                          heightBox(20),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                                color: Color(0xffff5252),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80))),
                            child: const Icon(
                              Icons.close,
                              size: 36,
                              color: whiteColor,
                            ),
                          ),
                          heightBox(20),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  content,
                                  style: styleOption(),
                                  textAlign: TextAlign.center,
                                ),
                                alignment: const Alignment(0, 0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                              ),
                              heightBox(20)
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: outlineButton(
                              () {
                                Navigator.pop(context, true);
                              },
                              Text(
                                'ລອງອີກຄັ້ງ',
                                style: styleOption(),
                              ),
                              whiteColor,
                              blackColor,
                              1.0,
                              50.0,
                              const EdgeInsets.fromLTRB(50, 10, 50, 10),
                            ),
                          ),
                          heightBox(20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }


  // loading dialog
   static Future<void> showLoadingDialog(BuildContext context,  {String? title}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            backgroundColor: whiteColor,
            children: [
              Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(
                        color: whiteColor,
                        strokeWidth: 5.0,
                        valueColor: AlwaysStoppedAnimation<Color>(yellowColor),
                      ),
                      heightBox(20),
                      Text(
                        "ກຳລັງໂຫຼດ...",
                        style: notosansFont(fontWieght: FontWeight.w400),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
