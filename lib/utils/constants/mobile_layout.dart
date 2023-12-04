// import 'package:flutter/cupertino.dart';
//
// class ResponsiveLayout {
//   static bool isPhone(BuildContext context) {
//     return MediaQuery.of(context).size.shortestSide < 600;
//   }
//
//   static bool isTablet(BuildContext context) {
//     return MediaQuery.of(context).size.shortestSide >= 600 &&
//         MediaQuery.of(context).size.shortestSide < 1200;
//   }
//
//   static bool isDesktop(BuildContext context) {
//     return MediaQuery.of(context).size.shortestSide >= 1200;
//   }
// }
//
// class ResponsiveWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     if (ResponsiveLayout.isDesktop(context)) {
//       return DesktopScreen();
//     } else if (ResponsiveLayout.isTablet(context)) {
//       return TabletScreen();
//     } else {
//       return MobileScreen();
//     }
//   }
// }
