import 'package:online_groceries_shop_app_flutter_admin/model/health_model.dart';

class HealthDetails {
  final healthData = const [
    HealthModel(
        icon: 'assets/icons/Orders.png', value: "8", title: "Total Orders"),
    HealthModel(
        icon: 'assets/icons/Delivered.png', value: "5", title: "Total Delivered"),
    HealthModel(
        icon: 'assets/icons/Canceled.png', value: "0", title: "Total Canceled"),
    HealthModel(icon: 'assets/icons/Revenue.png', value: "5", title: "Total Revenue"),
  ];
}
