import 'package:flutter/material.dart';

import '../main.dart';
import '../shared/constants/constants.dart';
import '../shared/helper/route.dart';
import '../view/widgets/snackbar.dart';

class AuthenticationProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  Future<void> login(String email, String password) async {
    try {
      updateLoader(true);

      await Future.delayed(const Duration(seconds: 3));
      if(email.isNotEmpty && password.isNotEmpty) {
        // Navigate to the home page
        Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createHomeRoute(),
              (Route<dynamic> route) => false,
        );
      } else{
        customSnackBar(appNavigatorKey.currentContext!, Constants.errorMessage);
      }
    } catch (e) {
      customSnackBar(appNavigatorKey.currentContext!, Constants.errorMessage);
    } finally {
      updateLoader(false);
    }
  }


  void logout() {
    Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
      createLoginRoute(), // Replace with your route creation logic
          (Route<dynamic> route) => false, // Remove all previous routes
    );
    notifyListeners();
  }

  void updateLoader(bool status) {
    _loading = status;
    notifyListeners();
  }
}
