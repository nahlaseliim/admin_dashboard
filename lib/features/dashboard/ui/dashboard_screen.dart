import 'package:admin_dashboard/features/dashboard/ui/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body:
      Row(
        children: [
          Container(
              width: 220,
              color: Colors.black87,
              child: Column(
                  children: const [
                    SizedBox(height: 40),
                    Text("Dashboard", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 20),
                    Text("Users", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 20),
                    Text("Orders", style: TextStyle(color: Colors.white)),
                  ]
              )
          ),
    Expanded(
    child: Container(
    color: Colors.grey.shade100,
    padding: const EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    "Dashboard Overview",
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),

    const SizedBox(height: 20),
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
    ]
    )
    )
    )
    ],

  )

    );
  }
}
