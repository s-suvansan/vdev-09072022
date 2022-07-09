import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  static const routeName = "Dashboard";
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.nonReactive(
        viewModelBuilder: () => DashboardViewModel(),
        onModelReady: (model) => model.onInit(context),
        builder: (context, model, _) {
          return Scaffold(
            body: Container(),
          );
        });
  }
}
