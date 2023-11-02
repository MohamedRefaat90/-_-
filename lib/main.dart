import 'dart:io';

import 'package:ecommerce/Bindings/myBindings.dart';
import 'package:ecommerce/core/class/https.dart';
import 'package:ecommerce/core/localization/changeLanguage.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/view/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/class/DeepLinkHandler.dart';
import 'core/constants/AppRoutes.dart';
import 'core/localization/transilation.dart';
import 'core/services/myServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DeepLinkHandler().initURIHandler();
  await initServices();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Ecommerce());
}

class Ecommerce extends GetView<LanguageController> {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: controller.theme,
        locale: controller.language,
        translations: MyTransilation(),
        initialBinding: myBindings(),
        // initiaRoute: AppRoutes.home,
        // initialRoute: AppRoutes.test,
        getPages: routes);
  }
}
