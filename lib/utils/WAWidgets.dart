import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';

import 'WAColors.dart';

InputDecoration waInputDecoration(
    {IconData? prefixIcon,
    String? hint,
    Color? bgColor,
    Color? borderColor,
    EdgeInsets? padding}) {
  return InputDecoration(
    contentPadding:
        padding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    counter: Offstage(),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: borderColor ?? WAPrimaryColor1)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    ),
    fillColor: bgColor ?? WAPrimaryColor1.withOpacity(0.04),
    hintText: hint,
    prefixIcon:
        prefixIcon != null ? Icon(prefixIcon, color: WAPrimaryColor1) : null,
    hintStyle: secondaryTextStyle(),
    filled: true,
  );
}

// Widget waCommonCachedNetworkImage(
//   String? url, {
//   double? height,
//   double? width,
//   BoxFit? fit,
//   AlignmentGeometry? alignment,
//   bool usePlaceholderIfUrlEmpty = true,
//   double? radius,
//   Color? color,
// }) {
//   if (url!.validate().isEmpty) {
//     return placeHolderWidget(
//         height: height,
//         width: width,
//         fit: fit,
//         alignment: alignment,
//         radius: radius);
//   } else if (url.validate().startsWith('http')) {
//     return CachedNetworkImage(
//       imageUrl: url,
//       height: height,
//       width: width,
//       fit: fit,
//       color: color,
//       alignment: alignment as Alignment? ?? Alignment.center,
//       errorWidget: (_, s, d) {
//         return placeHolderWidget(
//             height: height,
//             width: width,
//             fit: fit,
//             alignment: alignment,
//             radius: radius);
//       },
//       placeholder: (_, s) {
//         if (!usePlaceholderIfUrlEmpty) return SizedBox();
//         return placeHolderWidget(
//             height: height,
//             width: width,
//             fit: fit,
//             alignment: alignment,
//             radius: radius);
//       },
//     );
//   } else {
//     return Image.asset(url,
//             height: height,
//             width: width,
//             fit: fit,
//             alignment: alignment ?? Alignment.center)
//         .cornerRadiusWithClipRRect(radius ?? defaultRadius);
//   }
// }

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset('assets/placeholder.jpg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget waStatisticsWidget(
    {String? title, String? amount, Color? color, String? image}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: boxDecorationRoundedWithShadow(12),
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        // Container(
        //   decoration: boxDecorationWithRoundedCorners(
        //       backgroundColor: color!.withOpacity(0.1)),
        //   height: 30,
        //   width: 30,
        //   padding: EdgeInsets.all(5),
        //   child: Image.asset('assets/wa_ticket.png',
        //       fit: BoxFit.cover, height: 20, width: 20),
        // ),
        8.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(amount!, style: boldTextStyle(size: 14)),
            4.height,
            Text(title!, style: secondaryTextStyle(size: 12)),
          ],
        ),
      ],
    ),
  );
}