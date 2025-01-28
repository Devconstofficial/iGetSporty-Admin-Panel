import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_snackbar.dart';
import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:iget_sporty_admin_panel/services/admin_services.dart';
import 'package:iget_sporty_admin_panel/services/shared_preferences.dart';
import 'package:iget_sporty_admin_panel/utils/app_strings.dart';

class AuthController extends GetxController {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController forgotPasswordController =
      TextEditingController();
  final TextEditingController forgotPasswordComfirmController =
      TextEditingController();
  final PreferencesService prefs = PreferencesService();

  var isObsecureLoginPass = true.obs;
  var isObsecureForgotPass = true.obs;
  var isObsecureForgotConfirmPass = true.obs;
  var isLoading = false.obs;
  var verificationCode = ''.obs;

  Future<void> login() async {
    String email = loginEmailController.text.trim();
    String password = loginPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showCustomSnackbar("Error", "Please fill in all fields");
    } else {
      try {
        isLoading(true);

        Map<String, dynamic> response = await AdminServices.login(body: {
          'email': loginEmailController.text,
          'password': loginPasswordController.text,
        });

        if (response['success'] == true) {
          final userResponseModel =
              UserModel.fromJson(response['data']['user']);

          prefs.setUserLogin(true);

          prefs.saveUserModel(userResponseModel);

          prefs.setUserToken(response['data']['authToken']);

          Get.offAllNamed(kSideBarScreenRoute);

          showCustomSnackbar(
            "Success",
            response['message'],
            backgroundColor: Colors.green,
          );
        } else {
          _handleError(response['message'] ?? 'Something went wrong');
        }
      } catch (e) {
        log(e.toString());
        _handleError('Failed to sign in. Please try again.');
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> sendOTP() async {
    try {
      isLoading(true);

      Map<String, dynamic> response = await AdminServices.sendOtp(body: {
        'email': forgotEmailController.text.trim(),
      });

      if (response['success'] == true) {
        Get.toNamed(kPhoneVerificationScreenRoute,
            arguments: {'email': forgotEmailController.text.trim()});
        showCustomSnackbar(
          "Success",
          response['message'],
          backgroundColor: Colors.green,
        );
      } else {
        _handleError(response['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
      _handleError('Failed to send OTP. Please try again.');
    } finally {
      isLoading(false);
    }
  }

  Future<void> verifyOtp(String email) async {
    if (verificationCode.value.length != 4) {
      showCustomSnackbar('Error', 'Please enter a 4-digit verification code');
    } else {
      try {
        isLoading(true);

        Map<String, dynamic> response = await AdminServices.verifyEmail(
            body: {'email': email, 'otp': verificationCode.value});

        if (response['success'] == true) {
          Get.toNamed(kNewPasswordScreenRoute, arguments: {'email': email});
        } else {
          _handleError(response['message'] ?? 'Something went wrong');
        }
      } catch (e) {
        print(e.toString());
        _handleError('Failed to send OTP. Please try again.');
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> createPassword(String email) async {
    if (forgotPasswordController.text.trim() !=
        forgotPasswordComfirmController.text.trim()) {
      showCustomSnackbar('Error', 'Both passwords should be same');
    }
    if (forgotPasswordController.text.trim().isEmpty) {
      showCustomSnackbar('Error', 'Password cannot be empty');
    }
    if (forgotPasswordComfirmController.text.trim().isEmpty) {
      showCustomSnackbar('Error', 'Confirm Password cannot be empty');
    } else {
      try {
        isLoading(true);

        Map<String, dynamic> response = await AdminServices.forgotPassword(
            body: {'email': email, 'password': forgotPasswordController.text});

        if (response['success'] == true) {
          Get.offAllNamed(kLoginScreenRoute);
          showCustomSnackbar(
            "Success",
            response['message'],
            backgroundColor: Colors.green,
          );
        } else {
          _handleError(response['message'] ?? 'Something went wrong');
        }
      } catch (e) {
        print(e.toString());
        _handleError('Failed to send OTP. Please try again.');
      } finally {
        isLoading(false);
      }
    }
  }

  void _handleError(String message) {
    showCustomSnackbar("Error", message);
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();

    forgotEmailController.dispose();
    forgotPasswordComfirmController.dispose();
    forgotPasswordController.dispose();

    super.dispose();
  }
}
