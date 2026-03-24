import 'package:admin_dashboard/features/dashboard/ui/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

import '../ui/views/DashboardView.dart';
import '../ui/views/OrdersView.dart';
import '../ui/views/UsersView.dart';
import '../ui/widgets/SidebarItem.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int selectedIndex = 0;
  void onItemTapped(int index) {
  setState(() {
  selectedIndex = index;
  });
  }

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
                         SidebarItem(
                             title: 'Dashboard',
                             icon: Icons.dashboard,
                             index: 0,
                             selectedIndex: selectedIndex,
                             onTap: onItemTapped,
                           ),

                         SidebarItem(
                           title: 'Users',
                           icon: Icons.people,
                           index: 1,
                           selectedIndex: selectedIndex,
                           onTap: onItemTapped,
                         ),
                         SidebarItem(
                           title: 'Orders',
                           icon: Icons.shopping_basket_rounded,
                           index: 2,
                           selectedIndex: selectedIndex,
                           onTap: onItemTapped,
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
              child: Column(
                children: [

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search...",
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Icon(Icons.notifications_none),
                        const SizedBox(width: 10),
                        CircleAvatar(child: Icon(Icons.person)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: Builder(
                      builder: (context) {
                        switch (selectedIndex) {
                          case 0:
                            return DashboardView();
                          case 1:
                            return UsersView();
                          case 2:
                            return OrdersView();
                          default:
                            return Center(child: Text("Page not found"));
                        }
                      },
                    ),
                  ),
                ],
              )
            ),
          ),
    ],

  )

    );
  }
}
