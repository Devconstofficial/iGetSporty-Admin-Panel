import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_button.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_textfield.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/auth_controller.dart';

class NewPasswordScreen extends StatelessWidget {
  final AuthController authController = Get.find();

  NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (30.w)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 467.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: (80.h)),
                  Center(
                    child: Image.asset(
                      kLogo,
                      height: (171.h),
                      width: (317.w),
                    ),
                  ),
                  SizedBox(height: (37.h)),
                  Text(
                    "Set New Password",
                    style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("Please enter your new password.",
                      style:
                          AppStyles.greyTextStyle().copyWith(fontSize: 16.sp)),
                  SizedBox(height: (46.h)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("New Password",
                        style: AppStyles.greyTextStyle()
                            .copyWith(color: kGreyShade12Color)),
                  ),
                  SizedBox(height: (8.h)),
                  Obx(
                    () => CustomTextField(
                      height: 64,
                      borderRadius: 6,
                      controller: authController.forgotPasswordController,
                      hintText: "Enter new Password",
                      isObscure: authController.isObsecureForgotPass.value,
                      suffix: InkWell(
                          onTap: () {
                            authController.isObsecureForgotPass.value =
                                !authController.isObsecureForgotPass.value;
                          },
                          child: Icon(
                            authController.isObsecureForgotPass.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: kGreyColor,
                            size: 18.sp,
                          )),
                    ),
                  ),
                  SizedBox(height: (24.h)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Comfirm New Password",
                        style: AppStyles.greyTextStyle()
                            .copyWith(color: kGreyShade12Color)),
                  ),
                  SizedBox(height: (8.h)),
                  Obx(
                    () => CustomTextField(
                      height: 64,
                      borderRadius: 6,
                      controller:
                          authController.forgotPasswordComfirmController,
                      hintText: "Enter confirm new Password",
                      isObscure:
                          authController.isObsecureForgotConfirmPass.value,
                      suffix: InkWell(
                          onTap: () {
                            authController.isObsecureForgotConfirmPass.value =
                                !authController
                                    .isObsecureForgotConfirmPass.value;
                          },
                          child: Icon(
                            authController.isObsecureForgotConfirmPass.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: kGreyColor,
                            size: 18.sp,
                          )),
                    ),
                  ),
                  SizedBox(height: (32.h)),
                  Obx(() => authController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kSecondaryColor,
                          ),
                        )
                      : CustomButton(
                          title: "Update Password",
                          borderRadius: 10,
                          onTap: () {
                            authController.verifyOtp(email);
                          },
                        )),
                  SizedBox(height: 14.h),
                ]),
          ),
        ),
      ),
    );
  }
}
