import 'package:firebase_auth/firebase_auth.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future verifyPhoneNumber(
      {required String phoneNumber,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required Function(String, int?) codeSent,
      required Function(String) codeAutoRetrievalTimeout}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<AuthenticationModel> authenticateUser(Map userDetailsMap) async {
    try {
      final response = {
        "status": 200,
        "message": "User successfully Authenticated",
        "data": {
          "user": {
            "user_name": "",
            "user_id": "1234rfgvbnjio",
            "user_contact": 1234567890
          },
          "companies": [
            {
              "company_id": "1699019097",
              "company_domain": "",
              "company_email": "qwerty@gmail.com",
              "company_name": "qwertyuiop",
              "services": "",
              "company_logo": "",
              "onboarding_date": "2023-11-03T19:14:57.043566+05:30",
              "is_owner": true,
              "branches": [
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                },
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                },
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                }
              ]
            },
            {
              "company_id": "1699019097",
              "company_domain": "",
              "company_email": "qwerty@gmail.com",
              "company_name": "qwertyuiop",
              "services": "",
              "company_logo": "",
              "onboarding_date": "2023-11-03T19:14:57.043566+05:30",
              "is_owner": true,
              "branches": [
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                },
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                },
              ]
            },
            {
              "company_id": "1699019097",
              "company_domain": "",
              "company_email": "qwerty@gmail.com",
              "company_name": "qwertyuiop",
              "services": "",
              "company_logo": "",
              "onboarding_date": "2023-11-03T19:14:57.043566+05:30",
              "is_owner": true,
              "branches": [
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                },
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                },
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                }
              ]
            },
            {
              "company_id": "1699019097",
              "company_domain": "",
              "company_email": "qwerty@gmail.com",
              "company_name": "qwertyuiop",
              "services": "",
              "company_logo": "",
              "onboarding_date": "2023-11-03T19:14:57.043566+05:30",
              "is_owner": true,
              "branches": [
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                }
              ]
            },
            {
              "company_id": "1699019097",
              "company_domain": "",
              "company_email": "qwerty@gmail.com",
              "company_name": "qwertyuiop",
              "services": "",
              "company_logo": "",
              "onboarding_date": "2023-11-03T19:14:57.043566+05:30",
              "is_owner": true,
              "branches": [
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                },
                {
                  "branch_id": 1,
                  "branch_name": "TestingAddCompanyScript",
                  "branch_contact": 1236777890,
                  "branch_address": ""
                }
              ]
            },
          ]
        }
      };
      return AuthenticationModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
