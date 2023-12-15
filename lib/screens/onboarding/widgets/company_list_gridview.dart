import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class CompanyList extends StatelessWidget {
  final int selectedCompanyIndex;
  final List<Company> companyList;

  const CompanyList({
    super.key,
    required this.companyList,
    required this.selectedCompanyIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: spacingLarge,
                mainAxisSpacing: spacingLarge),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: companyList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    context
                        .read<OnboardingBloc>()
                        .add(SelectCompany(companyIndex: index));
                  },
                  child: Padding(
                      padding: EdgeInsets.all(context.responsive(spacingSmall,
                          tablets: spacingXXSmall, desktop: spacingSmall)),
                      child: Container(
                          height: 50,
                          padding: EdgeInsets.all(context.responsive(
                              spacingSmall,
                              tablets: spacingXXSmall,
                              desktop: spacingSmall)),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: (selectedCompanyIndex == index)
                                    ? AppColor.saasifyLightDeepBlue
                                    : AppColor.saasifyPaleGrey),
                            borderRadius:
                                BorderRadius.circular(kCircularRadius),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/error_image.png',
                                  height: 70,
                                  width: 70,
                                ),
                                const SizedBox(height: spacingXXSmall),
                                Text(companyList[index].companyName,
                                    maxLines: 1,
                                    textScaleFactor:
                                        context.responsive(0.8, desktop: 1),
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .tinier
                                        .copyWith(fontWeight: FontWeight.w500))
                              ]))));
            }));
  }
}
