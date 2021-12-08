import 'package:flutter/cupertino.dart';
import 'package:tea_post/api/order_services/dashboard_services.dart';
import 'package:tea_post/model/order/dashboard_order_model.dart';

class DashboardProvider with ChangeNotifier {
  DashboardOrderModel? dashboardOrderModel;
  bool loading = false;

  getDashboardOrderList(context) async {
    loading = true;
    dashboardOrderModel =
        await DashboardService().getDashboardOrderList(context);
    loading = false;

    notifyListeners();
  }
}
