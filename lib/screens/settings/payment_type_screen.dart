import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/payment/payments_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/settings/widgets/add_payment_method_popup.dart';
import 'package:saasify/screens/settings/widgets/payment_type_gridview.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_page_header.dart';
import '../../bloc/payment/payments_bloc.dart';
import '../../bloc/payment/payments_states.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';
import '../../widgets/alert_dialogue_box.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import '../dashboard/dashboard_screen.dart';

class PaymentTypeScreen extends StatelessWidget {
  static const String routeName = 'PaymentTypeScreen';

  PaymentTypeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.read<PaymentBloc>().add(FetchAllPayment());
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kStore),
                  desktop: const Expanded(child: SideBar(selectedIndex: 1))),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          right: spacingXHuge,
                          top: spacingXMedium,
                          bottom: spacingXHuge,
                          left: spacingXHuge),
                      child: BlocConsumer<PaymentBloc, PaymentStates>(
                          listener: (context, state) {
                        if (state is DeletingPayment) {
                          ProgressBar.show(context);
                        }
                        if (state is DeletedPayment) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialogueBox(
                                    title: StringConstants.kSuccess,
                                    message: state.message,
                                    primaryButtonTitle: StringConstants.kOk,
                                    checkMarkVisible: false,
                                    primaryOnPressed: () {
                                      Navigator.pop(ctx);
                                      context
                                          .read<PaymentBloc>()
                                          .add(FetchAllPayment());
                                    },
                                  ));
                        }

                        if (state is ErrorDeletingPayment) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialogueBox(
                                    title: StringConstants.kSomethingWentWrong,
                                    message: state.message,
                                    primaryButtonTitle: StringConstants.kOk,
                                    checkMarkVisible: false,
                                    primaryOnPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                  ));
                        }

                        if (state is EditedPayment) {
                          context.read<PaymentBloc>().add(FetchAllPayment());
                        }
                        if (state is ErrorDeletingPayment) {
                          showDialog(
                              context: context,
                              builder: (dialogueCtx) {
                                return AlertDialogueBox(
                                    title: StringConstants.kSomethingWentWrong,
                                    message: state.message,
                                    errorMarkVisible: true,
                                    primaryButtonTitle: StringConstants.kOk,
                                    primaryOnPressed: () {
                                      Navigator.pop(dialogueCtx);
                                    });
                              });
                        }
                        if (state is SavingPayment) {
                          ProgressBar.show(context);
                        } else if (state is SavedPayment) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialogueBox(
                                    title:
                                        StringConstants.kNewPaymentMethodAdded,
                                    message:
                                        StringConstants.kPaymentAddedMessage,
                                    primaryButtonTitle: StringConstants.kOk,
                                    checkMarkVisible: true,
                                    primaryOnPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(
                                          context, PaymentTypeScreen.routeName);
                                    },
                                  ));
                        } else if (state is ErrorSavingPayment) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialogueBox(
                                  title: StringConstants.kSomethingWentWrong,
                                  message: state.message,
                                  primaryButtonTitle: StringConstants.kOk,
                                  errorMarkVisible: true,
                                  primaryOnPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context, PaymentTypeScreen.routeName);
                                  }));
                        }
                      }, buildWhen: (prev, curr) {
                        return curr is FetchedPayment ||
                            curr is FetchingPayment;
                      }, builder: (context, state) {
                        if (state is FetchingPayment) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedPayment) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomPageHeader(
                                titleText: StringConstants.kPaymentType,
                                onBack: () {
                                  Navigator.pushReplacementNamed(
                                      context, DashboardsScreen.routeName);
                                },
                                backIconVisible: true,
                                buttonTitle:
                                    StringConstants.kAddNewPaymentMethod,
                                buttonVisible: true,
                                textFieldVisible: false,
                                onPressed: () {
                                  Map map = {};
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => AddNewPaymentTypePopup(
                                          isEdit: false,
                                          savePaymentDetailsMap: map));
                                },
                              ),
                              const SizedBox(height: spacingStandard),
                              PaymentTypeGridView(
                                  paymentType: state.paymentData)
                            ],
                          );
                        } else if (state is ErrorFetchingPayment) {
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
