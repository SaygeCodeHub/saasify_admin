import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/profile/widgets/profile_form.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/profile/fetch_profile_details_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_page_header.dart';
import '../../../widgets/primary_button.dart';
import '../../dashboard/dashboard_screen.dart';

class ProfileWebScreen extends StatelessWidget {
  const ProfileWebScreen({super.key, required this.profileData});

  final ProfileData profileData;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomPageHeader(
              textFieldVisible: false,
              onBack: () {
                Navigator.pushReplacementNamed(
                    context, DashboardsScreen.routeName);
              },
              backIconVisible: true,
              titleText: StringConstants.kProfile),
          const SizedBox(height: spacingStandard),
          Text(StringConstants.kBrandLogo,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: spacingXMedium),
          Container(
            height: kDashContainerHeight,
            width: kImageContainerWidth,
            decoration: BoxDecoration(
                color: AppColor.saasifyLightWhiteGrey,
                borderRadius: BorderRadius.circular(kCircularRadius)),
            child: Padding(
                padding: const EdgeInsets.all(spacingStandard),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: spacingSmall),
                      (profileData.storeLogo.toString().isNotEmpty)
                          ? Image.network(
                              profileData.storeLogo.toString(),
                              height: spacingXLarge,
                              width: spacingXLarge,
                              color: AppColor.saasifyPaleBlack,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text(
                                    StringConstants.kImageIsNotAvailable);
                              },
                            )
                          : Image.asset("assets/error_image.png",
                              height: kButtonHeight),
                    ])),
          ),
          const SizedBox(height: spacingStandard),
          Padding(
              padding: const EdgeInsets.only(right: spacingXXLarge),
              child: ProfileScreenForm(
                profileData: profileData,
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: spacingXXLarge),
                  child: PrimaryButton(
                      onPressed: () {},
                      buttonTitle: StringConstants.kUpdate,
                      buttonWidth: spacingXXXXHuge)))
        ]);
  }
}
