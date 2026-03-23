import 'package:flutter/material.dart';

import '../widgets/dashboard_card.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
              const Text(
              "Dashboard Overview",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
                const Text(
                "Here’s what’s happening today",
                style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 25),
                Row(
                children: const [
                DashboardCard(
                title: "Users",
                value: "1200",
                icon: Icons.people,
                color: Colors.blue,
                ),
                DashboardCard(
                title: "Orders",
                value: "320",
                icon: Icons.shopping_cart,
                color: Colors.orange,
                ),
                ],
                ),

                const SizedBox(height: 20),

                Row(
                children: const [
                DashboardCard(
                title: "Revenue",
                value: "\$5,430",
                icon: Icons.attach_money,
                color: Colors.green,
                ),
                DashboardCard(
                title: "Reports",
                value: "12",
                icon: Icons.bar_chart,
                color: Colors.purple,
                ),
                ],
                ),
              ],
            ),
          ),
        );
  }
}