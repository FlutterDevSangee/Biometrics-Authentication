import 'dart:developer';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class Authentication {
  static final auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async {
    return await auth.canCheckBiometrics || await auth.isDeviceSupported();
  }

  static Future<bool> authentication() async {
    try {
      if (!await canAuthenticate()) return false;
      bool isAuthenticated = await auth.authenticate(
          localizedReason: "Authenticate using Biometrics",
          options: const AuthenticationOptions(
              biometricOnly: false, // Set this to true to use biometrics only
              useErrorDialogs: true,
              stickyAuth: true,
              sensitiveTransaction: true),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Oops! Biometric authentication required!',
              cancelButton: 'No thanks',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ]
          // authMessages: [
          //   const AndroidAuthMessages(
          //       cancelButton: "Close",
          //       biometricHint: "Hint of biometric",
          //       biometricNotRecognized: "Custom not recognized",
          //       biometricRequiredTitle: "Custom title",
          //       goToSettingsButton: "Custom setting button",
          //       goToSettingsDescription: "Custom setting description",
          //       signInTitle: "Custom Title")
          // ],
          );
      return isAuthenticated;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
