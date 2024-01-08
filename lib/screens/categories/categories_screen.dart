import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/categories/categories_bloc.dart';
import 'package:saasify/bloc/categories/categories_event.dart';
import 'package:saasify/bloc/categories/categories_states.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/categories/widgets/category_mobile_screen.dart';
import 'package:saasify/screens/categories/widgets/category_web_screen.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/utils/responsive.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/alert_dialogue_box.dart';
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
                        if (state is SavedCategories) {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialogueBox(
                                    title: StringConstants.kSuccess,
                                    message: state.message,
                                    primaryButtonTitle: StringConstants.kOk,
                                    checkMarkVisible: true,
                                    primaryOnPressed: () {
                                      Navigator.pop(ctx);
                                      context
                                          .read<CategoriesBloc>()
                                          .add(FetchAllCategories());
                                    },
                                  ));
                        }

                        if (state is DeletingCategories) {
                          ProgressBar.show(context);
                        }
                        if (state is DeletedCategories) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialogueBox(
                                    title: StringConstants.kSuccess,
                                    message: state.message,
                                    primaryButtonTitle: StringConstants.kOk,
                                    checkMarkVisible: true,
                                    primaryOnPressed: () {
                                      Navigator.pop(ctx);
                                      context
                                          .read<CategoriesBloc>()
                                          .add(FetchAllCategories());
                                    },
                                  ));
                        }

                        if (state is ErrorDeletingCategories) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialogueBox(
                                    title: StringConstants.kSomethingWentWrong,
                                    message: state.message,
                                    primaryButtonTitle: StringConstants.kOk,
                                    errorMarkVisible: true,
                                    primaryOnPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                  ));
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
                        if (state is ErrorSavingCategories) {
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

                        if (state is ErrorFetchingCategories) {
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
                      }, buildWhen: (prev, curr) {
                        return curr is FetchedCategories ||
                            curr is FetchingCategories;
                      }, builder: (context, state) {
                        if (state is FetchingCategories) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is FetchedCategories) {
                          return LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return (constraints.maxWidth < 600)
                                ? CategoryMobileScreen(
                                    categoryList: state.categoryList)
                                : CategoryWebScreen(
                                    categoryList: state.categoryList);
                          });
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
