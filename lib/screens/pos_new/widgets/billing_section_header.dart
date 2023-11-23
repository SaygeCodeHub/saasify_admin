import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../configs/app_spacing.dart';

class BillingSectionHeader extends StatelessWidget {
  const BillingSectionHeader({super.key, required GlobalKey<FormState> formKey})
      : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ContactTile(isContact: true, formKey: _formKey),
      const SizedBox(height: spacingSmall),
      const Divider(color: AppColor.saasifyPaleGrey, thickness: 1)
    ]);
  }
}

class ContactTile extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final bool isContact;

  const ContactTile({super.key, required this.isContact, this.formKey});

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  late GlobalKey<FormState> formKey;
  TextEditingController contactController = TextEditingController();
  static bool addedContact = false;

  @override
  void initState() {
    addedContact = context.read<BillingBloc>().customer.customerContact != '';
    contactController.text =
        context.read<BillingBloc>().customer.customerContact;
    formKey = widget.formKey ?? GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (addedContact)
        ? Column(children: [
            Row(children: [
              Text(
                StringConstants.kMembershipNO,
                style: Theme.of(context).textTheme.xTiniest.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.saasifyDarkestBlack),
              ),
              const SizedBox(width: spacingSmall),
              Text(
                contactController.text,
                style: Theme.of(context)
                    .textTheme
                    .xTiniest
                    .copyWith(color: AppColor.saasifyGreyBlue),
              ),
              const SizedBox(width: spacingXSmall),
              InkWell(
                  onTap: () {
                    setState(() {
                      context.read<BillingBloc>().customer.customerContact = '';
                      context.read<BillingBloc>().customer.customerName = '';
                      addedContact = false;
                    });
                  },
                  child: const Icon(Icons.mode_edit_outline_outlined,
                      size: spacingStandard, color: AppColor.saasifyGreyBlue))
            ]),
            const SizedBox(height: spacingXXSmall),
            Row(children: [
              Text(
                StringConstants.kCustomerName,
                style: Theme.of(context).textTheme.xTiniest.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.saasifyDarkestBlack),
              ),
              const SizedBox(width: spacingSmall),
              Text(
                context.read<BillingBloc>().customer.customerName,
                style: Theme.of(context)
                    .textTheme
                    .xTiniest
                    .copyWith(color: AppColor.saasifyGreyBlue),
              )
            ])
          ])
        : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Form(
                    key: formKey,
                    child: TextFormField(
                      inputFormatters: (widget.isContact)
                          ? <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ]
                          : null,
                      maxLength: 10,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Contact no.';
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return "Please Enter a valid Phone No.";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          counterText: '', hintText: 'Enter Contact no.'),
                      controller: contactController,
                    ))),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      context.read<BillingBloc>().customer.customerContact =
                          contactController.text;
                      context.read<BillingBloc>().customer.customerName =
                          'Customer';
                      addedContact = true;
                    }
                  });
                },
                icon: const Icon(Icons.search))
          ]);
  }
}
