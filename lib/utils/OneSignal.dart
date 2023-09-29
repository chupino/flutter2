import 'package:diario_el_pueblo/core/constants/Ids.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


class OneSignalHelper {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
        //Remove this method to stop OneSignal Debugging 
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId(Ids.appIdOneSignal);

    // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
  }
}