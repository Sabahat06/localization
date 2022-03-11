import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Localization".tr()),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(width: double.infinity,),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
          Container(width: double.infinity, child: Text('bodyOfScreen'.tr())),
        ],
      ),
    );
  }
}
