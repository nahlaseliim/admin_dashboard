import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    final textColor = isSelected ? Colors.black : Colors.white;
    final iconColor = isSelected ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(icon, color: iconColor),
          title: Text(title, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}