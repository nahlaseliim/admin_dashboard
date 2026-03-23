import 'package:admin_dashboard/features/dashboard/ui/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Row(
        children: [
          Container(
              width:220,
              color: Colors.blueGrey,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                      children:
                       [
                         const SizedBox(height: 20),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             const Text(
                               "Admin Panel",
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 22,
                                 fontWeight: FontWeight.bold,
                               ),

                             ),
                              const SizedBox(width: 10),
                             Icon(Icons.admin_panel_settings
                             , color: Colors.white, size: 26),
                           ],
                         ),

                         const SizedBox(height: 20),
                         Container(
                           margin: const EdgeInsets.symmetric(horizontal: 10),
                           decoration: BoxDecoration(
                             color: Colors.white.withOpacity(0.1),
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child: const ListTile(
                             leading: Icon(Icons.dashboard, color: Colors.white),
                             title: Text("Dashboard", style: TextStyle(color: Colors.white)),
                           ),
                         ),
                       const ListTile(
                          leading: Icon(Icons.people, color: Colors.white),
                          title: Text("Users", style: TextStyle(color: Colors.white)),
                        ),
                       const ListTile(
                          leading: Icon(Icons.shopping_basket_rounded, color: Colors.white),
                          title: Text("Orders", style: TextStyle(color: Colors.white)),
                        ),
                      ]
                  ),
                ),
              )
          ),
    Expanded(
    child: Container(
    color: Colors.grey.shade100,
    padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
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
        ]
        ),
      ),
    )
    )
    )
    ],

  )

    );
  }
}
