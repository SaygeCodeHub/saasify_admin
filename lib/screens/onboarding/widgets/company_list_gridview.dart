import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';

class CompanyListGridview extends StatelessWidget {
  const CompanyListGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 70 / 40),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(spacingMedium),
                child: Container(
                    padding: const EdgeInsets.all(spacingSmall),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(spacingLarger),
                        color: AppColor.saasifyDarkBlue),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/GroupIcon.svg"),
                          const SizedBox(height: kCardRadius),
                          Padding(
                            padding: const EdgeInsets.only(left: spacingSmall),
                            child: Text(StringConstants.kChanduram,
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(color: AppColor.saasifyWhite)),
                          )
                        ])));
          }),
    );
  }
}
