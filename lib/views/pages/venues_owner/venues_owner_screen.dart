import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/views/pages/venues_owner/controller/venues_owner_controller.dart';

import '../../../utils/app_styles.dart';


class VenuesOwnerScreen extends GetView<VenuesOwnerController> {
  const VenuesOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Venues Screen', style: AppStyles.blackTextStyle().copyWith(fontSize: 60.sp),)
            ],
          ),
        ),
      ),
    );
  }
}