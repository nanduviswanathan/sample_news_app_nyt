import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../view/screens/home_page.dart';
import '../../view/screens/login_page.dart';

// These methods helps to navigate from one page to another

//navigate to login page
Route createLoginRoute() {
  return PageTransition(
    type: PageTransitionType.fade,
    duration: const Duration(milliseconds: 500),
    child: const LoginPage(),
  );
}


//navigate to signup page

Route createHomeRoute() {
  return PageTransition(
    type: PageTransitionType.fade,
    duration: const Duration(milliseconds: 500),
    child: HomePage(),
  );
}
