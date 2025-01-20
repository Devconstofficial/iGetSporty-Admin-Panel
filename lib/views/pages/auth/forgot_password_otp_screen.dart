import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_button.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/auth_controller.dart';
import 'package:pinput/pinput.dart';

class ForgotPasswordOtpScreen extends StatelessWidget {
  final AuthController authController = Get.find();

  ForgotPasswordOtpScreen({super.key});

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
                  SizedBox(height: (40.h)),
                  Text(
                    "Confirm OTP",
                    style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("Please enter your 4 digit code to reset your password.",
                      style:
                          AppStyles.greyTextStyle().copyWith(fontSize: 16.sp)),
                  SizedBox(height: (46.h)),
                  Pinput(
                    length: 4,
                    onChanged: (value) {
                      authController.verificationCode.value = value;
                    },
                    defaultPinTheme: PinTheme(
                      width: (56.w),
                      height: (56.h),
                      textStyle: AppStyles.blackTextStyle().copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: kGreyColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: (56.w),
                      height: (56.h),
                      textStyle: AppStyles.blackTextStyle().copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    showCursor: true,
                  ),
                  SizedBox(height: (44.h)),
                  Obx(() => authController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kSecondaryColor,
                          ),
                        )
                      : CustomButton(
                          title: "Verify OTP",
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
