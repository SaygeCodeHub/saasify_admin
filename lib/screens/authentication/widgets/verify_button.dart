import 'package:flutter/material.dart';
import 'package:saasify/screens/onboarding/companies_screen.dart';

import '../../../data/customer_cache/customer_cache.dart';
import '../../../data/models/authentication/authentication_model.dart';
import '../../../di/app_module.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/sidebar.dart';

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
          Navigator.pushReplacementNamed(context, CompaniesScreen.routeName,
              arguments: [
                Company.fromJson({
                  "company_id": "1702472309",
                  "company_domain": "",
                  "company_email": "",
                  "company_name": "Clothing",
                  "services": "",
                  "company_logo":
                      "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/erica-zhou-IHpUgFDn7zU-unsplash.jpg",
                  "onboarding_date": "2023-12-13T12:58:29.188697+00:00",
                  "is_owner": true,
                  "role": [0],
                  "branches": [
                    {
                      "branch_id": 1,
                      "branch_name": "Clothing",
                      "branch_contact": 8888881800,
                      "branch_currency": "₹",
                      "branch_active": true,
                      "branch_address": "Nagpur",
                      "role": [0]
                    }
                  ]
                }),
                Company.fromJson({
                  "company_id": "1702472309",
                  "company_domain": "",
                  "company_email": "",
                  "company_name": "Clothing",
                  "services": "",
                  "company_logo":
                      "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/erica-zhou-IHpUgFDn7zU-unsplash.jpg",
                  "onboarding_date": "2023-12-13T12:58:29.188697+00:00",
                  "is_owner": true,
                  "role": [0],
                  "branches": [
                    {
                      "branch_id": 1,
                      "branch_name": "Clothing",
                      "branch_contact": 8888881800,
                      "branch_currency": "₹",
                      "branch_active": true,
                      "branch_address": "Nagpur",
                      "role": [0]
                    }
                  ]
                }),
                Company.fromJson({
                  "company_id": "1702472309",
                  "company_domain": "",
                  "company_email": "",
                  "company_name": "Clothing",
                  "services": "",
                  "company_logo":
                      "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/erica-zhou-IHpUgFDn7zU-unsplash.jpg",
                  "onboarding_date": "2023-12-13T12:58:29.188697+00:00",
                  "is_owner": true,
                  "role": [0],
                  "branches": [
                    {
                      "branch_id": 1,
                      "branch_name": "Clothing",
                      "branch_contact": 8888881800,
                      "branch_currency": "₹",
                      "branch_active": true,
                      "branch_address": "Nagpur",
                      "role": [0]
                    }
                  ]
                }),
                Company.fromJson({
                  "company_id": "1702472309",
                  "company_domain": "",
                  "company_email": "",
                  "company_name": "Clothing",
                  "services": "",
                  "company_logo":
                      "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/erica-zhou-IHpUgFDn7zU-unsplash.jpg",
                  "onboarding_date": "2023-12-13T12:58:29.188697+00:00",
                  "is_owner": true,
                  "role": [0],
                  "branches": [
                    {
                      "branch_id": 1,
                      "branch_name": "Clothing",
                      "branch_contact": 8888881800,
                      "branch_currency": "₹",
                      "branch_active": true,
                      "branch_address": "Nagpur",
                      "role": [0]
                    }
                  ]
                }),
                Company.fromJson({
                  "company_id": "1702472309",
                  "company_domain": "",
                  "company_email": "",
                  "company_name": "Clothing",
                  "services": "",
                  "company_logo":
                      "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/erica-zhou-IHpUgFDn7zU-unsplash.jpg",
                  "onboarding_date": "2023-12-13T12:58:29.188697+00:00",
                  "is_owner": true,
                  "role": [0],
                  "branches": [
                    {
                      "branch_id": 1,
                      "branch_name": "Clothing",
                      "branch_contact": 8888881800,
                      "branch_currency": "₹",
                      "branch_active": true,
                      "branch_address": "Nagpur",
                      "role": [0]
                    }
                  ]
                }),
                Company.fromJson({
                  "company_id": "1702472309",
                  "company_domain": "",
                  "company_email": "",
                  "company_name": "Clothing",
                  "services": "",
                  "company_logo":
                      "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/erica-zhou-IHpUgFDn7zU-unsplash.jpg",
                  "onboarding_date": "2023-12-13T12:58:29.188697+00:00",
                  "is_owner": true,
                  "role": [0],
                  "branches": [
                    {
                      "branch_id": 1,
                      "branch_name": "Clothing",
                      "branch_contact": 8888881800,
                      "branch_currency": "₹",
                      "branch_active": true,
                      "branch_address": "Nagpur",
                      "role": [0]
                    }
                  ]
                }),
                Company.fromJson({
                  "company_id": "1702472309",
                  "company_domain": "",
                  "company_email": "",
                  "company_name": "Clothing",
                  "services": "",
                  "company_logo":
                      "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/erica-zhou-IHpUgFDn7zU-unsplash.jpg",
                  "onboarding_date": "2023-12-13T12:58:29.188697+00:00",
                  "is_owner": true,
                  "role": [0],
                  "branches": [
                    {
                      "branch_id": 1,
                      "branch_name": "Clothing",
                      "branch_contact": 8888881800,
                      "branch_currency": "₹",
                      "branch_active": true,
                      "branch_address": "Nagpur",
                      "role": [0]
                    }
                  ]
                }),
                Company.fromJson({
                  "company_id": "1702472309",
                  "company_domain": "",
                  "company_email": "",
                  "company_name": "Clothing",
                  "services": "",
                  "company_logo":
                      "https://storage.googleapis.com/saasify-5ddd8.appspot.com/uploaded_images/erica-zhou-IHpUgFDn7zU-unsplash.jpg",
                  "onboarding_date": "2023-12-13T12:58:29.188697+00:00",
                  "is_owner": true,
                  "role": [0],
                  "branches": [
                    {
                      "branch_id": 1,
                      "branch_name": "Clothing",
                      "branch_contact": 8888881800,
                      "branch_currency": "₹",
                      "branch_active": true,
                      "branch_address": "Nagpur",
                      "role": [0]
                    }
                  ]
                }),
              ]);
        },
        buttonTitle: StringConstants.kVerify);
  }
}
