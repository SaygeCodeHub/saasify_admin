import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class BranchListGridview extends StatelessWidget {
  final List<Branch> branchList;

  const BranchListGridview({super.key, required this.branchList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: branchList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: context.responsive(70 / 40,
                  tablets: 55 / 40, desktop: 70 / 40)),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context
                    .read<OnboardingBloc>()
                    .add(SelectBranch(branchIndex: index));
              },
              child: Padding(
                  padding: EdgeInsets.all(context.responsive(spacingSmall,
                      tablets: spacingXXSmall, desktop: spacingSmall)),
                  child: Container(
                      padding: EdgeInsets.all(context.responsive(spacingSmall,
                          tablets: spacingXXSmall, desktop: spacingSmall)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kCardRadius),
                          color: AppColor.saasifyCementGrey),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: SvgPicture.asset("assets/fridge.svg")),
                            Text(branchList[index].branchName,
                                maxLines: 1,
                                textScaleFactor:
                                    context.responsive(0.8, desktop: 1),
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(color: AppColor.saasifyWhite))
                          ]))),
            );
          }),
    );
  }
}
