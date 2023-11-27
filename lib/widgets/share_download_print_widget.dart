import 'package:flutter/material.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class ShareDownloadPrintWidget extends StatelessWidget {
  const ShareDownloadPrintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Icon(Icons.share,
          color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize),
      SizedBox(width: spacingLarge),
      Icon(Icons.download,
          color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize),
      SizedBox(width: spacingLarge),
      Icon(Icons.print, color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize)
    ]);
  }
}
