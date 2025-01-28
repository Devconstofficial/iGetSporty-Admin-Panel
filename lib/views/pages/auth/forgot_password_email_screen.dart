import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_button.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_textfield.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/auth_controller.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  final AuthController authController = Get.find();

  ForgotPasswordEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "Forgot Password?",
                    style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                      "Please enter your email address to reset your password.",
                      style:
                          AppStyles.greyTextStyle().copyWith(fontSize: 16.sp)),
                  SizedBox(height: (46.h)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email",
                        style: AppStyles.greyTextStyle()
                            .copyWith(color: kGreyShade12Color)),
                  ),
                  SizedBox(height: (8.h)),
                  CustomTextField(
                    height: 64,
                    borderRadius: 6,
                    controller: authController.forgotEmailController,
                    hintText: "Email",
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: (32.h)),
                  Obx(() => authController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kSecondaryColor,
                          ),
                        )
                      : CustomButton(
                          title: "Submit",
                          borderRadius: 10,
                          onTap: () {
                            authController.sendOTP();
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
