import 'package:fashion/common/brand_color.dart';
import 'package:fashion/dashboard/dashboard_view.dart';
import 'package:fashion/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'init/init_view.dart';
import 'login/login_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion',
      routes: routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: BrandColor.brandColor,
          secondary: BrandColor.brandColor,
        ),
      ),
      home: const InitView(),
    );
  }
}

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  LoginView.routeName: ((context) => const LoginView()),
  DashboardView.routeName: ((context) => const DashboardView()),
};
