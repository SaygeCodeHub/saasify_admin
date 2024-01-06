import 'package:flutter/material.dart';

import '../../../data/customer_cache/customer_cache.dart';
import '../../../di/app_module.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/sidebar.dart';
import '../../dashboard/dashboard_screen.dart';

class AuthVerifyButton extends StatelessWidget {
  final CustomerCache _customerCache = getIt<CustomerCache>();

  AuthVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        onPressed: () {
          _customerCache.setIsLoggedIn(true);
          _customerCache.setUserId("OvcqwTKNuHSL5ILAOZ6Y3OGcmrj2");
          _customerCache.setCompanyId('1702472309');
          _customerCache.setBranchId(1);
          _customerCache.setUserContact(918888881800);
          _customerCache.setUserName("Adityaaaaaa");
          SideBar.userContact = 918888881800;
          SideBar.userName = 'Adityaaaaaa';
          Navigator.pushReplacementNamed(context, DashboardsScreen.routeName);
        },
        buttonTitle: StringConstants.kVerify);
  }
}
