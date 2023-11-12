import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import 'bill_details.dart';

class BillingSectionHeader extends StatelessWidget {
  const BillingSectionHeader({
    super.key,
    required this.productsByCategories,
    required this.billDetails,
  });

  final List<CategoryWithProductsDatum> productsByCategories;
  final BillModel billDetails;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Order',
            style: Theme.of(context).textTheme.xxTiniest,
          ),
          InkWell(
              onTap: () {
                context.read<BillingBloc>().add(
                    ExpandBilling(productsByCategories: productsByCategories));
              },
              child: SvgPicture.asset('assets/maximize.svg', height: 14)),
        ],
      ),
      const SizedBox(height: spacingSmall),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Order no. - 000',
          style: Theme.of(context)
              .textTheme
              .tiniest
              .copyWith(color: AppColor.saasifyLightGrey),
        ),
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(kGeneralRadius)),
                        contentPadding: const EdgeInsets.all(spacingSmall),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.close)),
                              ],
                            ),
                            BillDetails(billDetails: billDetails),
                            const Spacer(),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Settle Bill'))
                          ],
                        ),
                      ));
            },
            child: const Text('Bill Details',
                style: TextStyle(
                    color: AppColor.saasifyLightDeepBlue,
                    decoration: TextDecoration.underline))),
      ]),
      const SizedBox(height: spacingXXSmall),
      const ContactTile(),
    ]);
  }
}

class ContactTile extends StatefulWidget {
  const ContactTile({
    super.key,
  });

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController contactController = TextEditingController();
  bool addedContact = false;

  @override
  Widget build(BuildContext context) {
    return (addedContact)
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Text(
                  'Contact - ${contactController.text}',
                  style: Theme.of(context)
                      .textTheme
                      .tiniest
                      .copyWith(color: AppColor.saasifyLightDeepBlue),
                ),
                const SizedBox(width: spacingMedium),
                InkWell(
                    onTap: () {
                      setState(() {
                        addedContact = false;
                      });
                    },
                    child:
                        const Icon(Icons.edit, color: AppColor.saasifyGreyBlue))
              ],
            ),
            InkWell(
                onTap: () {},
                child: Text('View Membership',
                    style: Theme.of(context).textTheme.tiniest.copyWith(
                        color: AppColor.saasifyLightDeepBlue,
                        decoration: TextDecoration.underline)))
          ])
        : Row(children: [
            Expanded(
                child: Form(
                    key: formKey,
                    child: TextFormField(
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
                        hintText: 'Enter Contact no.',
                      ),
                      controller: contactController,
                    ))),
            TextButton(
                onPressed: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      context.read<BillingBloc>().customerContact =
                          contactController.text;
                      addedContact = true;
                    }
                  });
                },
                child: Text("Add",
                    style: Theme.of(context).textTheme.tiniest.copyWith(
                        color: AppColor.saasifyLightDeepBlue,
                        decoration: TextDecoration.underline)))
          ]);
  }
}
