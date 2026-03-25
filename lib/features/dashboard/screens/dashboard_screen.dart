import 'package:admin_dashboard/features/dashboard/ui/views/getSelectedView.dart';
import 'package:admin_dashboard/features/dashboard/ui/widgets/topBarWidget.dart';
import 'package:flutter/material.dart';
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
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Scaffold(

      body:
      isDesktop ?
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
                const  TopBarWidget(),
                  const SizedBox(height: 20),

                  Expanded(
                    child:getSelectedView(selectedIndex),
                  ),
                ],
              )
            ),
          ),
    ],

  )
        : Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard",
          style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
        ),
        drawer: Drawer(
          backgroundColor: Colors.blueGrey,
          child: SingleChildScrollView(
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
                    onTap: (index) {
                      onItemTapped(index);
                      Navigator.pop(context);
                    },
                  ),

                  SidebarItem(
                    title: 'Users',
                    icon: Icons.people,
                    index: 1,
                    selectedIndex: selectedIndex,
                    onTap: (index){
                      onItemTapped(index);
                      Navigator.pop(context);
                    }
                  ),
                  SidebarItem(
                    title: 'Orders',
                    icon: Icons.shopping_basket_rounded,
                    index: 2,
                    selectedIndex: selectedIndex,
                      onTap: (index){
                        onItemTapped(index);
                        Navigator.pop(context);
                      }
                  ),
                ]
            ),
          ),
        ),
        body: Column(
          children: [
            const  TopBarWidget(),
            const SizedBox(height: 20),
             Expanded(
               child:
                 getSelectedView(selectedIndex)
               ),

          ],
        )
    ),
    );
  }
}
