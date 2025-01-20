import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'utils/app_colors.dart';
import 'utils/app_strings.dart';
import 'utils/route_generator.dart';
import 'utils/screen_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kWhiteColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      scaffoldBackgroundColor: kPrimaryColor,
      colorScheme: ThemeData().colorScheme.copyWith(primary: kPrimaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            theme: _buildTheme(Brightness.light),
            title: kAppName,
            debugShowCheckedModeBanner: false,
            initialBinding: ScreenBindings(),
            initialRoute: kLoginScreenRoute,
            getPages: RouteGenerator.getPages(),
            builder: (context, child) {
              return child!;
            });
      },
    );
  }
}
