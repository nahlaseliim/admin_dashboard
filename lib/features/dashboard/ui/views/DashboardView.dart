import 'package:admin_dashboard/features/dashboard/logic/dashboard_cubit/dashboard_cubit.dart';
import 'package:admin_dashboard/features/dashboard/logic/dashboard_cubit/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/dashboard_card.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery
              .of(context)
              .size
              .height,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const Text(
                "Dashboard Overview",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),

              const SizedBox(height: 8),
              const Text(
                "Here’s what’s happening today",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 25),
              BlocBuilder<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                    String usersValue = "0";
                    String ordersValue = "0";
                    String revenueValue = "\$0";
                    String reportsValue = "0";
                    bool isLoading = false;
                    if (state is DashboardLoading) {
                      usersValue = ordersValue = revenueValue = reportsValue = "";
                      isLoading = true;
                    } else if (state is DashboardSuccess) {
                      usersValue = state.data.usersCount.toString();
                      ordersValue = state.data.ordersCount.toString();
                      revenueValue = state.data.revenue;
                      reportsValue = state.data.reportsCount.toString();
                    } else if (state is DashboardError) {
                      usersValue = ordersValue = revenueValue = reportsValue = "Error!";
                    }
                    return Column(
                      children: [
                        Row(
                          children: [
                            DashboardCard(
                              title: "Users",
                              value: usersValue,
                              icon: Icons.people,
                              color: Colors.blue,
                            ),
                            DashboardCard(
                              title: "Orders",
                              value: ordersValue,
                              icon: Icons.shopping_cart,
                              color: Colors.orange,
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            DashboardCard(
                              title: "Revenue",
                              value: revenueValue,
                              icon: Icons.attach_money,
                              color: Colors.green,
                            ),
                            DashboardCard(
                              title: "Reports",
                              value: reportsValue,
                              icon: Icons.bar_chart,
                              color: Colors.purple,
                            ),

                          ],
                        ),
                          if (isLoading)
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: CircularProgressIndicator(),
                            )
                        else if (state is DashboardError)
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(state.message, style: const TextStyle(color: Colors.red)),
                          ),
                      ],
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
