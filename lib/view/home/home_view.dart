import 'package:flutter/material.dart';
import 'package:online_groceries_shop_app_flutter_admin/util/responsive.dart';
import 'package:online_groceries_shop_app_flutter_admin/widgets/dashboard_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(
                // flex: 2,
                child: SizedBox(
                  // child: SideMenuWidget(),
                ),
              ),
            Expanded(
              flex: 7,
              child: DashboardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
