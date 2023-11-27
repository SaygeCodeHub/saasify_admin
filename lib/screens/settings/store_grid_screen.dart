import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/settings/three_dots_popup.dart';
import 'package:saasify/screens/settings/widgets/add_store_popup.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class StoreGridScreen extends StatelessWidget {
  static const String routeName = 'StoreGridScreen';

  StoreGridScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 4),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kStore),
                  desktop: const Expanded(child: SideBar(selectedIndex: 4))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingXHuge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            context.responsive(const SizedBox(),
                                desktop: Text(StringConstants.kStore,
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxTiny
                                        .copyWith(
                                            fontWeight: FontWeight.w700))),
                            context.responsive(const SizedBox(),
                                desktop: const Spacer()),
                            const Spacer(),
                            SizedBox(
                                width: kGeneralActionButtonWidth,
                                child: PrimaryButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) =>
                                              const AddStorePopup());
                                    },
                                    buttonTitle: StringConstants.kAddNewStore))
                          ]),
                          const SizedBox(height: spacingStandard),
                          GridView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    height: spacingStandard,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            kCircularRadius),
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  AppColor.saasifyLightPaleGrey,
                                              blurRadius: 5.0)
                                        ],
                                        color: AppColor.saasifyWhite),
                                    child: Padding(
                                        padding: const EdgeInsets.all(
                                            kCircularRadius),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("Name",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .tiniest
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColor
                                                                  .saasifyDarkGrey)),
                                                  const SizedBox(
                                                      height: spacingXSmall),
                                                  Text(
                                                    'Currency',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xxTiniest,
                                                  ),
                                                  const SizedBox(
                                                      height: spacingXXSmall),
                                                  Text(
                                                    'Location',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xxTiniest,
                                                  ),
                                                ],
                                              ),
                                              Row(children: [
                                                Switch(
                                                    activeColor: AppColor
                                                        .saasifyLightDeepBlue,
                                                    value: true,
                                                    onChanged: (value) {}),
                                                const SizedBox(width: 6),
                                                const ThreeDotsPopup()
                                              ]),
                                            ])));
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 4,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20))
                        ],
                      )))
            ]));
  }
}
