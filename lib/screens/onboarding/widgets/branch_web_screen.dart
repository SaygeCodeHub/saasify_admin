import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/configs/spacing.dart';

import '../../../bloc/onboarding/onboarding_bloc.dart';
import '../../../bloc/onboarding/onboarding_event.dart';
import '../../../bloc/onboarding/onboarding_state.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/authentication/authentication_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';
import '../../dashboard/dashboard_screen.dart';
import 'branch_list_gridview.dart';

class BranchWebScreen extends StatelessWidget {
  const BranchWebScreen({
    super.key,
    required this.formKey,
    required this.selectedCompany,
  });

  final GlobalKey<FormState> formKey;
  final Company selectedCompany;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset("assets/gradient.svg", fit: BoxFit.fill),
        Padding(
            padding: const EdgeInsets.all(webBodyPadding),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.30,
                child: BlocBuilder<OnboardingBloc, OnboardingStates>(
                    builder: (context, state) {
                  if (state is BranchesLoaded) {
                    return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/saasify_logo.svg",
                              width: 50, height: 50),
                          const SizedBox(
                              height: spacingBetweenTextFieldAndButton),
                          Text(StringConstants.kBranches,
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(fontWeight: FontWeight.w700)),
                          const SizedBox(height: spacingLarge),
                          BranchList(
                              selectedBranchIndex: state.selectedBranchIndex,
                              branchList: selectedCompany.branches),
                          PrimaryButton(
                              onPressed: (state.selectedBranchIndex != -1)
                                  ? () {
                                      context.read<OnboardingBloc>().add(
                                          SetCompanyAndBranchIds(
                                              companyId:
                                                  selectedCompany.companyId,
                                              branchId: selectedCompany
                                                  .branches[
                                                      state.selectedBranchIndex]
                                                  .branchId));
                                      Navigator.pushReplacementNamed(
                                          context, DashboardsScreen.routeName);
                                    }
                                  : null,
                              buttonTitle: 'Next')
                        ]);
                  }
                  return const SizedBox.shrink();
                }),
              ),
            ))
      ],
    );
  }
}
