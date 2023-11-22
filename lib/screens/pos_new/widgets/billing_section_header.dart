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
      const ContactTile(isContact: false),
      const SizedBox(height: spacingStandard),
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
  bool addedContact = false;

  @override
  void initState() {
    formKey = widget.formKey ?? GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (addedContact)
        ? Row(children: [
            Text(
              (widget.isContact)
                  ? StringConstants.kMembershipNO
                  : StringConstants.kCustomerName,
              style: Theme.of(context).textTheme.xTiniest.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.saasifyDarkestBlack),
            ),
            const SizedBox(
              width: spacingSmall,
            ),
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
                    addedContact = false;
                  });
                },
                child: const Icon(Icons.mode_edit_outline_outlined,
                    size: spacingStandard, color: AppColor.saasifyGreyBlue))
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
                      maxLength: (widget.isContact) ? 10 : null,
                      validator: (widget.isContact)
                          ? (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Contact no.';
                              }
                              if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                return "Please Enter a valid Phone No.";
                              }
                              return null;
                            }
                          : null,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: (widget.isContact)
                            ? 'Enter Contact no.'
                            : 'Enter Name',
                      ),
                      controller: contactController,
                    ))),
            TextButton(
                onPressed: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      (widget.isContact)
                          ? context.read<BillingBloc>().customerContact =
                              contactController.text
                          : context.read<BillingBloc>().customerName =
                              contactController.text;
                      addedContact = true;
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: spacingSmall),
                  child: Text("Add",
                      style: Theme.of(context).textTheme.tiniest.copyWith(
                          color: AppColor.saasifyLightDeepBlue,
                          decoration: TextDecoration.underline)),
                ))
          ]);
  }
}
