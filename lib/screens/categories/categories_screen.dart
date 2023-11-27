import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/categories/categories_bloc.dart';
import 'package:saasify/bloc/categories/categories_event.dart';
import 'package:saasify/bloc/categories/categories_states.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/categories/widgets/categories_grid.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/secondary_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/custom_alert_box.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = 'CategoriesScreen';

  CategoriesScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(FetchAllCategories());

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
                      headingText: StringConstants.kCategories),
                  desktop: const Expanded(child: SideBar(selectedIndex: 4))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(spacingLarge),
                      child: BlocConsumer<CategoriesBloc, CategoriesStates>(
                          listener: (context, state) {
                        if (state is DeletedCategories) {
                          ProgressBar.dismiss(context);
                          context
                              .read<CategoriesBloc>()
                              .add(FetchAllCategories());
                        }

                        if (state is DeletingCategories) {
                          ProgressBar.show(context);
                        }

                        if (state is ErrorDeletingCategories) {
                          ProgressBar.dismiss(context);
                        }

                        if (state is EditedCategories) {
                          context
                              .read<CategoriesBloc>()
                              .add(FetchAllCategories());
                        }
                        if (state is ErrorEditingCategories) {
                          showDialog(
                              context: context,
                              builder: (dialogueCtx) {
                                return CustomAlertDialog(
                                    title: StringConstants.kSomethingWentWrong,
                                    message: state.message,
                                    errorMarkVisible: true,
                                    primaryButtonTitle: StringConstants.kOk,
                                    primaryOnPressed: () {
                                      Navigator.pop(dialogueCtx);
                                    });
                              });
                        }
                        if (state is ErrorFetchingCategories) {
                          showDialog(
                              context: context,
                              builder: (dialogueCtx) {
                                return CustomAlertDialog(
                                    title: StringConstants.kSomethingWentWrong,
                                    message: state.message,
                                    errorMarkVisible: true,
                                    primaryButtonTitle: StringConstants.kOk,
                                    primaryOnPressed: () {
                                      Navigator.pop(dialogueCtx);
                                    });
                              });
                        }
                      }, buildWhen: (prev, curr) {
                        return curr is FetchedCategories ||
                            curr is FetchingCategories;
                      }, builder: (context, state) {
                        if (state is FetchingCategories) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedCategories) {
                          return Column(children: [
                            Row(children: [
                              context.responsive(const SizedBox(),
                                  desktop: Text(StringConstants.kCategories,
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
                                            builder: (ctx) => AlertDialog(
                                                content: SizedBox(
                                                    width: kDialogueWidth,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  StringConstants
                                                                      .kAddNewCategory,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .xTiniest
                                                                      .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w700)),
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      const Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child: Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: AppColor
                                                                            .saasifyGrey),
                                                                  )),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height:
                                                                  spacingMedium),
                                                          Text(
                                                              StringConstants
                                                                  .kCategoryName,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .xTiniest),
                                                          const SizedBox(
                                                              height:
                                                                  spacingXXSmall),
                                                          CustomTextField(
                                                              onTextFieldChanged:
                                                                  (value) {}),
                                                          const SizedBox(
                                                              height:
                                                                  spacingSmall),
                                                          Text(
                                                              StringConstants
                                                                  .kEnterGSTAmount,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .xTiniest),
                                                          const SizedBox(
                                                              height:
                                                                  spacingXXSmall),
                                                          CustomTextField(
                                                              onTextFieldChanged:
                                                                  (value) {}),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  StringConstants
                                                                      .kDoYouWantToDeactivateGST,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .xTiniest),
                                                              Switch(
                                                                  activeColor:
                                                                      AppColor
                                                                          .saasifyLightDeepBlue,
                                                                  value: true,
                                                                  onChanged:
                                                                      (value) {
                                                                    // Map productDetails = productList[index].toJson();
                                                                    // productDetails['variant_active'] = value;
                                                                    // context.read<ProductBloc>().add(
                                                                    //     EditProduct(productDetailsMap: productDetails));
                                                                  })
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height:
                                                                spacingXMedium,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    SecondaryButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        buttonTitle:
                                                                            StringConstants.kCancel),
                                                              ),
                                                              const SizedBox(
                                                                width:
                                                                    spacingXXSmall,
                                                              ),
                                                              Expanded(
                                                                child: PrimaryButton(
                                                                    onPressed:
                                                                        () {},
                                                                    buttonTitle:
                                                                        StringConstants
                                                                            .kOk),
                                                              )
                                                            ],
                                                          )
                                                        ]))));
                                      },
                                      buttonTitle:
                                          StringConstants.kAddCategory))
                            ]),
                            const SizedBox(height: spacingStandard),
                            CategoriesGrid(productCategory: state.categoryList),
                            Visibility(
                                visible: state.categoryList.isEmpty,
                                child: Center(
                                    child: Text(
                                        StringConstants.kNoDataAvailable,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColor
                                                    .saasifyLightGrey)))),
                            Visibility(
                                visible: state.categoryList.isEmpty,
                                child: const Spacer())
                          ]);
                        } else if (state is ErrorFetchingCategories) {
                          return Expanded(
                              child: Center(
                                  child: Text(StringConstants.kNoDataAvailable,
                                      style: Theme.of(context)
                                          .textTheme
                                          .tinier
                                          .copyWith(
                                              color:
                                                  AppColor.saasifyLightGrey))));
                        } else {
                          return const SizedBox.shrink();
                        }
                      })))
            ]));
  }
}
