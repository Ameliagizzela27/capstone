import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'WAColors.dart';

const purchaseURL =
    "https://codecanyon.net/item/prokit-flutter-app-ui-design-templete-kit/25787190";

void Alert(context, Color colorBackground, Color colorText, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: colorBackground,
      content: Text(
        text,
        style: primaryTextStyle(size: 14, color: colorText),
      )));
}

Future<void> ModalText(context, String text, List<IconsButton> act) {
  return Dialogs.materialDialog(
      barrierDismissible: true,
      color: Colors.white,
      title: 'Peringatan',
      customView: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(text,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: primaryTextStyle(color: Colors.black54, size: 16)),
      ),
      customViewPosition: CustomViewPosition.BEFORE_ACTION,
      context: context,
      actions: act
      // [
      // IconsButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   text: 'Kembali',
      //   iconData: Icons.arrow_back,
      //   color: WAInfo1,
      //   textStyle: TextStyle(color: Colors.white),
      //   iconColor: Colors.white,
      // ),
      // ]
      );
}

Future<void> ModalContainer(context, Widget component, List<IconsButton> act) {
  return Dialogs.materialDialog(
      barrierDismissible: true,
      color: Colors.white,
      title: 'Peringatan',
      customView: component,
      customViewPosition: CustomViewPosition.BEFORE_ACTION,
      context: context,
      actions: act
      // [
      // IconsButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   text: 'Kembali',
      //   iconData: Icons.arrow_back,
      //   color: WAInfo1,
      //   textStyle: TextStyle(color: Colors.white),
      //   iconColor: Colors.white,
      // ),
      // ]
      );
}
