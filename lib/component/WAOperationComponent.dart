import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class WAOperationComponent extends StatelessWidget {
  final dynamic itemModel;
  final bool isApplyColor;
  WAOperationComponent({this.itemModel, this.isApplyColor = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 60,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: boxDecorationRoundedWithShadow(
              16,
              backgroundColor: isApplyColor
                  ? itemModel!.color!.withOpacity(0.1)
                  : Colors.white,
              shadowColor: isApplyColor
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.2),
            ),
            child: Image.network(
              '${itemModel!.image!}',
              width: 40,
            ),
          ),
          8.height,
          Text('${itemModel!.title!}',
              style: boldTextStyle(size: 14),
              textAlign: TextAlign.center,
              maxLines: 2),
        ],
      ),
    );
  }
}
