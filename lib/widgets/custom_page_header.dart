import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';
import '../utils/constants/string_constants.dart';
import 'custom_text_field.dart';

class CustomPageHeader extends StatelessWidget {
  const CustomPageHeader(
      {super.key,
      required this.titleText,
      this.textFieldVisible = true,
      this.buttonVisible = false,
      this.onPressed,
      this.buttonTitle = '',
      this.inkWellOnTap,
      this.backIconVisible = false});

  final String titleText;
  final String buttonTitle;
  final bool textFieldVisible;
  final bool buttonVisible;
  final bool backIconVisible;
  final void Function()? onPressed;
  final void Function()? inkWellOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Visibility(
        visible: backIconVisible,
        child: InkWell(
            onTap: inkWellOnTap,
            child: context.responsive(const SizedBox(),
                desktop: const Icon(Icons.arrow_back_ios_new))),
      ),
      const SizedBox(width: spacingSmall),
      context.responsive(const SizedBox(),
          desktop: Text(titleText,
              style: Theme.of(context)
                  .textTheme
                  .xxTiny
                  .copyWith(fontWeight: FontWeight.w700))),
      context.responsive(const SizedBox(), desktop: const Spacer()),
      Expanded(
          flex: 5,
          child: Visibility(
            visible: textFieldVisible,
            child: CustomTextField(
                hintText: StringConstants.kSearchHere,
                onTextFieldChanged: (value) {}),
          )),
      const Spacer(),
      Visibility(
        visible: buttonVisible,
        child: PrimaryButton(onPressed: onPressed, buttonTitle: buttonTitle),
      ),
      Row(
        children: [
          const Spacer(),
          IconButton(
              icon: const Icon(Icons.share,
                  color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize),
              onPressed: () {}),
          const SizedBox(width: spacingLarge),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.download,
                color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize),
          ),
          const SizedBox(width: spacingLarge),
          IconButton(
              icon: const Icon(Icons.print,
                  color: AppColor.saasifyGreyBlue, size: kHeaderIconsSize),
              onPressed: () {})
        ],
      )
    ]);
  }
}
