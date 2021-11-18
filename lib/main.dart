import 'package:crm_msi/controller/controllers.dart';
import 'package:crm_msi/ui/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("787d6428-2b70-463d-a858-eec955e1a922");
  Get.put(LoginController());

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  runApp(MyApp());
}

class MyApp extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      title: 'CRM - MIS',
      debugShowCheckedModeBanner: false,
      home: GetBuilder<LoginController>(
          id: 'login',
          builder: (_) => (controller.loadingLogin)
              ? LoadingFullScreen()
              : (controller.islogin)
                  ? MainPage()
                  : LoginPage()),
    );
  }
}
