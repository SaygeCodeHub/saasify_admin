import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_bloc.dart';
import 'package:saasify/bloc/product/product_event.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/bloc/upload/upload_bloc.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import 'package:saasify/bloc/upload/upload_states.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/screen_arguments/add_product_screen_arguments.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_alert_box.dart';
import 'package:saasify/widgets/custom_dropdown.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/secondary_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/sidebar.dart';

class AddProductScreen extends StatelessWidget {
  static const String routeName = 'AddProductScreen';

  final bool isEdit;
  final bool isVariant;
  final Map dataMap;

  AddProductScreen(
      {super.key,
      required this.isEdit,
      required this.isVariant,
      required this.dataMap});

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<UploadBloc>().pickedImageList.clear();
    if (isEdit) {
      context.read<UploadBloc>().pickedImageList.addAll(dataMap['image']);
    }
    context.read<ProductBloc>().add(FetchAllCategories());
    return Scaffold(
        drawer: const SideBar(selectedIndex: 3),
        key: _scaffoldKey,
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  Container(
                      color: AppColor.saasifyLightDeepBlue,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: spacingSmall, horizontal: spacingLarge),
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              iconSize: 30,
                              icon: const Icon(Icons.menu,
                                  color: AppColor.saasifyWhite)),
                        )
                      ])),
                  desktop: const Expanded(
                    child: SideBar(selectedIndex: 3),
                  )),
              Expanded(
                  flex: 5,
                  child: BlocConsumer<ProductBloc, ProductStates>(
                    listener: (ctx, state) {
                      if (state is ErrorFetchingCategories) {
                        showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                                title: StringConstants.kSomethingWentWrong,
                                message: state.message,
                                primaryButtonTitle: StringConstants.kUnderstood,
                                checkMarkVisible: false,
                                primaryOnPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, ProductListScreen.routeName);
                                }));
                      }

                      if (state is SavingProduct || state is EditingProduct) {
                        ProgressBar.show(ctx);
                      } else if (state is SavedProduct) {
                        ProgressBar.dismiss(ctx);
                        showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                                  title: StringConstants.kNewProductAdded,
                                  message:
                                      StringConstants.kContinueAddingVariant,
                                  primaryButtonTitle:
                                      StringConstants.kAddVariantButton,
                                  checkMarkVisible: true,
                                  secondaryButtonTitle: StringConstants.kNo,
                                  primaryOnPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, AddProductScreen.routeName,
                                        arguments: AddProductScreenArguments(
                                            isEdit: false,
                                            isVariant: true,
                                            dataMap: {
                                              'product_name':
                                                  state.data.productName,
                                              'category_name':
                                                  state.data.categoryName,
                                              'brand_name':
                                                  state.data.brandName,
                                              'product_id':
                                                  state.data.productId,
                                              'product_description':
                                                  state.data.productDescription,
                                            }));
                                  },
                                  secondaryOnPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, ProductListScreen.routeName);
                                  },
                                ));
                      } else if (state is EditedProduct) {
                        ProgressBar.dismiss(ctx);
                        showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                                title: StringConstants.kNewProductAdded,
                                message: state.message,
                                primaryButtonTitle: StringConstants.kUnderstood,
                                checkMarkVisible: true,
                                primaryOnPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, ProductListScreen.routeName);
                                }));
                      } else if (state is ErrorSavingProduct) {
                        ProgressBar.dismiss(ctx);
                        showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                                title: StringConstants.kSomethingWentWrong,
                                message: state.message,
                                primaryButtonTitle: StringConstants.kUnderstood,
                                checkMarkVisible: false,
                                primaryOnPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, ProductListScreen.routeName);
                                }));
                      } else if (state is ErrorEditingProduct) {
                        ProgressBar.dismiss(ctx);
                        showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                                title: StringConstants.kSomethingWentWrong,
                                message: state.message,
                                primaryButtonTitle: StringConstants.kUnderstood,
                                checkMarkVisible: false,
                                primaryOnPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, ProductListScreen.routeName);
                                }));
                      }
                    },
                    buildWhen: (prev, curr) {
                      return curr is FetchingCategories ||
                          curr is FetchedCategories;
                    },
                    builder: (context, state) {
                      if (state is FetchingCategories) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is FetchedCategories) {
                        return Form(
                          key: _formKey,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  top: spacingXXLarge,
                                  left: spacingXHuge,
                                  right: kHelloSpacingHeight),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pushReplacementNamed(
                                                  context,
                                                  ProductListScreen.routeName);
                                            },
                                            icon: const Icon(
                                                Icons.arrow_back_ios_new)),
                                        Text(
                                            (isVariant == true)
                                                ? StringConstants.kAddVariant
                                                : (isEdit)
                                                    ? 'Edit Product'
                                                    : StringConstants
                                                        .kAddProduct,
                                            style: Theme.of(context)
                                                .textTheme
                                                .xxTiny
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700)),
                                      ],
                                    ),
                                    const SizedBox(height: spacingXHuge),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Text(StringConstants.kCategory,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xxTiniest
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                const SizedBox(
                                                    height: spacingXMedium),
                                                SizedBox(
                                                    height: kDropdownHeight,
                                                    child: CustomDropdownWidget(
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.trim() ==
                                                                  '') {
                                                            return 'Please Select a Category';
                                                          }
                                                          return null;
                                                        },
                                                        canEdit: !(isVariant &&
                                                            !isEdit),
                                                        // dataMap: dataMap,
                                                        // mapKey: 'category_name',
                                                        initialValue: dataMap[
                                                                'category_name'] ??
                                                            state.categoryList
                                                                .map((e) => e
                                                                    .categoryName)
                                                                .toList()[0],
                                                        listItems: state
                                                            .categoryList
                                                            .map((e) =>
                                                                e.categoryName)
                                                            .toList())),
                                                const SizedBox(
                                                    height: spacingHuge),
                                                Wrap(children: [
                                                  Text(
                                                      StringConstants
                                                          .kProductDescription,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xxTiniest
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                  const SizedBox(
                                                      width: spacingXSmall),
                                                  Text(
                                                      StringConstants.kMaxLines,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .xTiniest)
                                                ]),
                                                const SizedBox(
                                                    height: spacingXMedium),
                                                CustomTextField(
                                                    maxLines: 5,
                                                    validator: (value) {
                                                      if ((value == null ||
                                                              value.trim() ==
                                                                  '') &&
                                                          dataMap['draft'] ==
                                                              true) {
                                                        return 'Please Enter the Product Description';
                                                      }
                                                      return null;
                                                    },
                                                    readOnly:
                                                        isVariant && !isEdit,
                                                    initialValue: dataMap[
                                                            'product_description'] ??
                                                        '',
                                                    onTextFieldChanged:
                                                        (value) {
                                                      dataMap['product_description'] =
                                                          value;
                                                    }),
                                              ])),
                                          const SizedBox(width: spacingXXHuge),
                                          Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Text(StringConstants.kName,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xxTiniest
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                const SizedBox(
                                                    height: spacingXMedium),
                                                CustomTextField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.trim() == '') {
                                                        return 'Please Enter the Product Name';
                                                      }
                                                      return null;
                                                    },
                                                    readOnly:
                                                        isVariant && !isEdit,
                                                    initialValue: dataMap[
                                                            'product_name'] ??
                                                        '',
                                                    onTextFieldChanged:
                                                        (value) {
                                                      dataMap['product_name'] =
                                                          value;
                                                    }),
                                                const SizedBox(
                                                    height: spacingHuge),
                                                Text(StringConstants.kBarcode,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xxTiniest
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                const SizedBox(
                                                    height: spacingXMedium),
                                                CustomTextField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.trim() == '') {
                                                        return 'Please Enter the Product Barcode';
                                                      }
                                                      return null;
                                                    },
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    initialValue:
                                                        dataMap['barcode'] ??
                                                            '',
                                                    onTextFieldChanged:
                                                        (value) {
                                                      dataMap['barcode'] =
                                                          value;
                                                    }),
                                                const SizedBox(
                                                    height: spacingHuge),
                                                Row(children: [
                                                  Expanded(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                        Text(
                                                            StringConstants
                                                                .kQuantity,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xxTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                        const SizedBox(
                                                            height:
                                                                spacingXMedium),
                                                        CustomTextField(
                                                            validator: (value) {
                                                              if ((value ==
                                                                          null ||
                                                                      value.trim() ==
                                                                          '') &&
                                                                  dataMap['draft'] ==
                                                                      true) {
                                                                return 'Please Enter the Product Quantity';
                                                              }
                                                              return null;
                                                            },
                                                            inputFormatters: <TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            initialValue: dataMap[
                                                                    'quantity'] ??
                                                                '',
                                                            onTextFieldChanged:
                                                                (value) {
                                                              dataMap['quantity'] =
                                                                  value;
                                                            })
                                                      ])),
                                                  const SizedBox(
                                                      width: spacingLarger),
                                                  Expanded(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                        Text(
                                                            StringConstants
                                                                .kMeasuringQuantity,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xxTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                        const SizedBox(
                                                            height:
                                                                spacingXMedium),
                                                        SizedBox(
                                                            height:
                                                                kDropdownHeight,
                                                            child:
                                                                CustomDropdownWidget(
                                                              initialValue:
                                                                  dataMap['unit'] ??
                                                                      "units",
                                                              listItems: const [
                                                                "units",
                                                                "kg",
                                                                "l",
                                                                "gm",
                                                                "m"
                                                              ],
                                                              // dataMap:
                                                              //     dataMap,
                                                              // mapKey: 'unit'
                                                            ))
                                                      ]))
                                                ])
                                              ])),
                                          const SizedBox(width: spacingXXHuge),
                                          Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Text(StringConstants.kBrand,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xxTiniest
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                const SizedBox(
                                                    height: spacingXMedium),
                                                CustomTextField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.trim() == '') {
                                                        return 'Please Enter the Brand Name';
                                                      }
                                                      return null;
                                                    },
                                                    readOnly:
                                                        isVariant && !isEdit,
                                                    initialValue:
                                                        dataMap['brand_name'] ??
                                                            '',
                                                    onTextFieldChanged:
                                                        (value) {
                                                      dataMap['brand_name'] =
                                                          value;
                                                    }),
                                                const SizedBox(
                                                    height: spacingHuge),
                                                Row(children: [
                                                  Expanded(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                        Text(
                                                            StringConstants
                                                                .kPrice,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xxTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                        const SizedBox(
                                                            height:
                                                                spacingXMedium),
                                                        CustomTextField(
                                                            validator: (value) {
                                                              if ((value ==
                                                                          null ||
                                                                      value.trim() ==
                                                                          '') &&
                                                                  dataMap['draft'] ==
                                                                      true) {
                                                                return 'Please Enter the Product Cost';
                                                              }
                                                              return null;
                                                            },
                                                            inputFormatters: <TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            initialValue:
                                                                dataMap['cost'] ??
                                                                    '',
                                                            onTextFieldChanged:
                                                                (value) {
                                                              dataMap['cost'] =
                                                                  value;
                                                            })
                                                      ])),
                                                  const SizedBox(
                                                      width: spacingLarger),
                                                  Expanded(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                        Text(
                                                            StringConstants
                                                                .kDiscountPercent,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xxTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                        const SizedBox(
                                                            height:
                                                                spacingXMedium),
                                                        CustomTextField(
                                                            inputFormatters: <TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            initialValue: dataMap[
                                                                    'discount_percent'] ??
                                                                '0',
                                                            onTextFieldChanged:
                                                                (value) {
                                                              dataMap['discount_percent'] =
                                                                  value;
                                                            })
                                                      ]))
                                                ]),
                                                const SizedBox(
                                                    height: spacingHuge),
                                                Row(children: [
                                                  Expanded(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                        Text(
                                                            StringConstants
                                                                .kStock,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xxTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                        const SizedBox(
                                                            height:
                                                                spacingXMedium),
                                                        CustomTextField(
                                                            inputFormatters: <TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            initialValue: dataMap[
                                                                    'stock'] ??
                                                                '',
                                                            onTextFieldChanged:
                                                                (value) {
                                                              dataMap['stock'] =
                                                                  value;
                                                            })
                                                      ])),
                                                  const SizedBox(
                                                      width: spacingLarger),
                                                  Expanded(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                        Text(
                                                            StringConstants
                                                                .kLowStock,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .xxTiniest
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                        const SizedBox(
                                                            height:
                                                                spacingXMedium),
                                                        CustomTextField(
                                                            inputFormatters: <TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            initialValue: dataMap[
                                                                    'restock_reminder'] ??
                                                                '',
                                                            onTextFieldChanged:
                                                                (value) {
                                                              dataMap['restock_reminder'] =
                                                                  value;
                                                            })
                                                      ]))
                                                ])
                                              ]))
                                        ]),
                                    const SizedBox(height: spacingHuge),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Text(StringConstants.kUploadImages,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xxTiniest
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                            const SizedBox(
                                                width: spacingXSmall),
                                            Text(
                                                StringConstants
                                                    .kMinimumOneImage,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xTiniest)
                                          ]),
                                          const SizedBox(height: spacingLarge),
                                          BlocConsumer<UploadBloc,
                                              UploadStates>(
                                            listener: (context, state) {
                                              if (state is UploadImageLoading) {
                                                ProgressBar.show(context);
                                              } else if (state
                                                  is UploadImageLoaded) {
                                                ProgressBar.dismiss(context);
                                                dataMap['images'] =
                                                    state.uploadImageModel.data;
                                                if (isEdit) {
                                                  context
                                                      .read<ProductBloc>()
                                                      .add(EditProduct(
                                                          productDetailsMap:
                                                              dataMap));
                                                } else {
                                                  context
                                                      .read<ProductBloc>()
                                                      .add(SaveProduct(
                                                          productDetailsMap:
                                                              dataMap));
                                                }
                                              }
                                              if (state is UploadImageError) {
                                                ProgressBar.dismiss(context);
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (context) => Expanded(
                                                              child:
                                                                  CustomAlertDialog(
                                                                      title: StringConstants
                                                                          .kSomethingWentWrong,
                                                                      message: state
                                                                          .message,
                                                                      primaryButtonTitle:
                                                                          StringConstants
                                                                              .kUnderstood,
                                                                      checkMarkVisible:
                                                                          false,
                                                                      primaryOnPressed:
                                                                          () {
                                                                        Navigator.pushReplacementNamed(
                                                                            context,
                                                                            ProductListScreen.routeName);
                                                                      }),
                                                            ));
                                              }
                                            },
                                            buildWhen: (prev, curr) {
                                              return curr is! ImageCouldNotPick;
                                            },
                                            builder: (context, state) {
                                              if (state is ImagePicked) {
                                                return GridView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 6,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 6,
                                                            childAspectRatio: 1,
                                                            crossAxisSpacing:
                                                                spacingStandard),
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (index <
                                                          context
                                                              .read<
                                                                  UploadBloc>()
                                                              .pickedImageList
                                                              .length) {
                                                        return Stack(
                                                          children: [
                                                            (context.read<UploadBloc>().pickedImageList[
                                                                        index]
                                                                    is String)
                                                                ? Container(
                                                                    decoration: BoxDecoration(
                                                                        image: DecorationImage(
                                                                            image: NetworkImage(context.read<UploadBloc>().pickedImageList[
                                                                                index])),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                spacingSmall)))
                                                                : Container(
                                                                    decoration: BoxDecoration(
                                                                        image: DecorationImage(
                                                                            image:
                                                                                MemoryImage(context.read<UploadBloc>().pickedImageList[index])),
                                                                        borderRadius: BorderRadius.circular(spacingSmall))),
                                                            IconButton(
                                                                onPressed: () {
                                                                  context
                                                                      .read<
                                                                          UploadBloc>()
                                                                      .pickedImageList
                                                                      .removeAt(
                                                                          index);
                                                                  context
                                                                      .read<
                                                                          UploadBloc>()
                                                                      .add(
                                                                          RemoveImage());
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .close))
                                                          ],
                                                        );
                                                      }
                                                      return InkWell(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  UploadBloc>()
                                                              .add(PickImage());
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: AppColor
                                                                    .saasifyLighterGrey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            spacingSmall))),
                                                      );
                                                    });
                                              }
                                              return GridView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: 6,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 6,
                                                          childAspectRatio: 1,
                                                          crossAxisSpacing:
                                                              spacingStandard),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<UploadBloc>()
                                                            .add(PickImage());
                                                      },
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              color: AppColor
                                                                  .saasifyLighterGrey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          spacingSmall))),
                                                    );
                                                  });
                                            },
                                          )
                                        ]),
                                    const SizedBox(height: spacingSmall),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SecondaryButton(
                                              onPressed: () {
                                                dataMap['draft'] = true;
                                                context.read<UploadBloc>().add(
                                                    UploadImage(
                                                        multiplePartFileList:
                                                            context
                                                                .read<
                                                                    UploadBloc>()
                                                                .pickedFiles));
                                              },
                                              buttonWidth: spacingXXXXHuge,
                                              buttonTitle:
                                                  StringConstants.kSave),
                                          const SizedBox(width: spacingLarge),
                                          PrimaryButton(
                                              onPressed: () {
                                                dataMap['draft'] = false;
                                                if (_formKey.currentState!
                                                        .validate() &&
                                                    context
                                                        .read<UploadBloc>()
                                                        .pickedFiles
                                                        .isNotEmpty) {
                                                  context
                                                      .read<UploadBloc>()
                                                      .add(UploadImage(
                                                          multiplePartFileList:
                                                              context
                                                                  .read<
                                                                      UploadBloc>()
                                                                  .pickedFiles));
                                                }
                                              },
                                              buttonWidth: spacingXXXXHuge,
                                              buttonTitle:
                                                  StringConstants.kPublish),
                                        ])
                                  ])),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ))
            ]));
  }
}
