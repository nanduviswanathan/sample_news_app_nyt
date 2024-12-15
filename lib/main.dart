import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_flutter/shared/constants/colors.dart';
import 'package:sample_app_flutter/shared/constants/constants.dart';
import 'package:sample_app_flutter/view/screens/login_page.dart';
import 'package:sample_app_flutter/view/screens/splash_screen.dart';
import 'package:sample_app_flutter/viewmodel/authentication_provider.dart';
import 'package:sample_app_flutter/viewmodel/home_provider.dart';

Future<void> main()  async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: appNavigatorKey,
        debugShowCheckedModeBanner: false,
        title: Constants.newsAppText,
        theme: _buildTheme(Brightness.light),
        home: const SplashScreen(),
      ),
    );
  }

  // to build theme data
  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
    );

    return baseTheme;
  }
}
