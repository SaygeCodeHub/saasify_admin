import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/screens/onboarding/widgets/branch_mobile_screen.dart';
import 'package:saasify/screens/onboarding/widgets/branch_web_screen.dart';

class BranchesListScreen extends StatelessWidget {
  final Company selectedCompany;

  static const String routeName = 'BranchesListScreen';

  BranchesListScreen({super.key, required this.selectedCompany});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<OnboardingBloc>().add(SelectBranch(branchIndex: -1));
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return (constraints.maxWidth < 600)
          ? BranchMobileScreen(
              formKey: formKey, selectedCompany: selectedCompany)
          : BranchWebScreen(formKey: formKey, selectedCompany: selectedCompany);
    }));
  }
}
