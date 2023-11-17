import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/bloc/onboarding/onboarding_state.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/screens/onboarding/list_of_branches_screen.dart';
import 'package:saasify/screens/onboarding/widgets/company_list_gridview.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/custom_text_field.dart';

class CompanyListScreen extends StatelessWidget {
  final List<Company> companyList;
  static const routeName = 'CompanyListScreen';

  CompanyListScreen({super.key, required this.companyList});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<OnboardingBloc>().add(SelectCompany(companyIndex: -1));
    return Scaffold(
        body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 4,
          child: Form(
              key: formKey,
              child: Padding(
                  padding: const EdgeInsets.all(spacingXXXHuge),
                  child: BlocBuilder<OnboardingBloc, OnboardingStates>(
                    builder: (context, state) {
                      if (state is CompaniesLoaded) {
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/SaaSify.svg",
                                  height: kGeneralButtonHeight,
                                  width: kLogoWidth),
                              const SizedBox(height: spacingXXHuge),
                              Text(StringConstants.kCompanies,
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiny
                                      .copyWith(fontWeight: FontWeight.w700)),
                              const SizedBox(height: spacingMedium),
                              CustomTextField(
                                  hintText: StringConstants.kSearchCompanies,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .xTiniest
                                      .copyWith(fontWeight: FontWeight.w500),
                                  keyboardType: TextInputType.text,
                                  onTextFieldChanged: (value) {}),
                              const SizedBox(height: spacingXXHuge),
                              CompanyListGridview(
                                  companyList: companyList,
                                  selectedCompanyIndex:
                                      state.selectedCompanyIndex),
                              const SizedBox(height: spacingXXHuge),
                              PrimaryButton(
                                  onPressed: (state.selectedCompanyIndex != -1)
                                      ? () {
                                          Navigator.pushNamed(context,
                                              BranchesListScreen.routeName,
                                              arguments: companyList[
                                                  state.selectedCompanyIndex]);
                                        }
                                      : null,
                                  buttonTitle: 'Next')
                            ]);
                      }
                      return const SizedBox.shrink();
                    },
                  )))),
      Expanded(
          flex: 6,
          child: Container(
            color: AppColor.saasifyLightDeepBlue,
          ))
    ]));
  }
}