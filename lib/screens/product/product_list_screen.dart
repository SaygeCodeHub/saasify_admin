import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';
import 'package:saasify/widgets/sidebar.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = 'ProductListScreen';
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: SideBar(selectedIndex: 2)),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(spacingLarge),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              hintText: 'Search here....',
                              onTextFieldChanged: (value) {}),
                        ),
                        const Spacer(),
                        Expanded(
                            child: PrimaryButton(
                                onPressed: () {}, buttonTitle: 'Add Product'))
                      ],
                    ),
                    const SizedBox(
                      height: spacingStandard,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
