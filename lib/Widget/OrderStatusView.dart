import 'package:dawey/Comman/pref.dart';
import 'package:dawey/Screens/CustomerController/orderDetailsController.dart';
import 'package:dawey/Widget/colorConvert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class TimelineDelivery extends StatelessWidget {
//   final int screenlag;
//   final OrderDetailsController orderDerailsController = Get.find();

//   TimelineDelivery({Key key, this.screenlag}) : super(key: key);
//   Widget setDeliveryStatusView(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10.0),
//       child: Column(
//           mainAxisSize: MainAxisSize.min,

//           children: List.generate(
//             orderDerailsController.orderStatusLogResult.length,
//             (index) {
//               var timeline = orderDerailsController.orderStatusLogResult[index];

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       tick(
//                         timeline.colorCode,
//                         index == 0 ? false: true
//                       ),
//                       _RightChild(
//                         asset: 'assets/delivery/order_placed.png',
//                         title: Pref.getString(Pref.IS_ENGLISH) == "0" ? timeline.orderStatusName : timeline.orderStatusArabic,
//                         message: 'We have received your order.',
//                         color: colorConvert(timeline.colorCode),
//                       ),
//                     ],
//                   ).paddingZero,
//                   // spacer(),
//                   if (index != orderDerailsController.orderStatusLogResult.length - 1)
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                       child: line(timeline.colorCode),
//                     ),
//                   // spacer(),
//                 ],
//               );
//             },
//           )),
//     );
//   }

//   Widget tick(color, isFirst) {
//     return isFirst ? Container(
//       transform: Matrix4.translationValues(0, -10, 0),
//       decoration: BoxDecoration(
//         color: colorConvert(color),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       width: 20,
//       height: 20,
//     ): Container(
//       transform: Matrix4.translationValues(0, -0, 0),
//       decoration: BoxDecoration(
//         color: colorConvert(color),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       width: 20,
//       height: 20,
//     );
//   }

//   Widget spacer() {
//     return Container(
//       height: 2.0,
//     );
//   }

//   Widget line(color) {
//     return Container(
//       transform: Matrix4.translationValues(0, -5, 0),
//       color: colorConvert(color),
//       height: 25.0,
//       width: 3,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return setDeliveryStatusView(context);
//   }
// }
class TimelineDelivery extends StatelessWidget {
  final int screenlag;
  final OrderDetailsController orderDerailsController = Get.find();

  TimelineDelivery({Key key, this.screenlag}) : super(key: key);
  Widget setDeliveryStatusView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            orderDerailsController.orderStatusLogResult.length,
            (index) {
              var timeline = orderDerailsController.orderStatusLogResult[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      tick(
                        timeline.colorCode,
                      ),
                      _RightChild(
                       // isArabic: Pref.getString(Pref.IS_ENGLISH) == "0" ?true:false,
                        asset: 'assets/delivery/order_placed.png',
                        title: Pref.getString(Pref.IS_ENGLISH) == "0" ? timeline.orderStatusName : timeline.orderStatusArabic,
                        message: 'We have received your order.',
                        color: colorConvert(timeline.colorCode),
                      ),
                    ],
                  ).paddingZero,
                  // spacer(),
                  if (index != orderDerailsController.orderStatusLogResult.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: line(timeline.colorCode),
                    ),
                  // spacer(),
                ],
              );
            },
          )),
    );
  }

  Widget tick(color) {
    return Container(
      decoration: BoxDecoration(
        color: colorConvert(color),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 20,
      height: 20,
    );
  }

  Widget spacer() {
    return Container(
      height: 2.0,
    );
  }

  Widget line(color) {
    return Container(
      //transform: Matrix4.translationValues(0, -5, 0),
      color: colorConvert(color),
      height: 25.0,
      width: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return setDeliveryStatusView(context);
  }
}
// class TimelineDelivery extends StatelessWidget {
//   final int screenlag;
//   final OrderDetailsController orderDerailsController = Get.find();

//   TimelineDelivery({Key key, this.screenlag}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     print(orderDerailsController.orderStatusLogResult);
//     return Container(
//       transform: Matrix4.translationValues(0, -25, 0),
//       child: Center(
//         child: ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: orderDerailsController.orderStatusLogResult.length,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             var timeline = orderDerailsController.orderStatusLogResult[index];
//             return TimelineTile(

//               alignment: TimelineAlign.manual,
//               lineXY: 0.1,
//               isFirst: index == 0 ? true : false,
//               isLast: index == orderDerailsController.orderStatusLogResult.length - 1 ? true : false,
//               indicatorStyle: IndicatorStyle(
//                 width: 20,
//                 color: colorConvert(timeline.colorCode),
//                 padding: EdgeInsets.all(6),
//               ),
//               endChild: _RightChild(
//                 asset: 'assets/delivery/order_placed.png',
//                 title: Pref.getString(Pref.IS_ENGLISH) == "0" ? timeline.orderStatusName : timeline.orderStatusArabic,
//                 message: 'We have received your order.',
//                 color: colorConvert(timeline.colorCode),
//               ),
//               beforeLineStyle: LineStyle(
//                 thickness: 2,
//                 color: colorConvert(timeline.colorCode),
//                 // Color(0xFF27AA69),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class _RightChild extends StatelessWidget {
  _RightChild({
    Key key,
    this.asset,
    this.title,
    this.message,
    this.isArabic,
    this.color,
  }) : super(key: key);

  final String asset;
  final String title;
  final String message;
  final bool isArabic;
  final Color color;

  @override
  Widget build(BuildContext context) {
    print("TimeLine");
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32, top: 0, bottom: 0),
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: Pref.getString(Pref.IS_ENGLISH) == "0" ? 18 : 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
