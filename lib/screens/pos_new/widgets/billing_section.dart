import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import 'bill_details.dart';
import 'billing_products_list.dart';
import 'billing_section_footer.dart';
import 'billing_section_header.dart';

class BillingSection extends StatelessWidget {
  BillingSection({super.key, required this.posData});

  final List<CategoryWithProductsDatum> posData;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(spacingMedium),
        decoration: const BoxDecoration(color: AppColor.saasifyLightGreyBlue),
        child: Column(children: [
          BillingSectionHeader(formKey: _formKey),
          const SizedBox(height: spacingLarge),
          BillingProductsList(posData: posData),
          const SizedBox(height: spacingSmall),
          BillDetails(billDetails: context.read<BillingBloc>().billDetails),
          const SizedBox(height: spacingMedium),
          BillingSectionFooter(formKey: _formKey)
        ]));
  }
}
