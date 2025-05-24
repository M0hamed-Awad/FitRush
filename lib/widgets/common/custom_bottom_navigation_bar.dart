import 'package:fit_rush_app/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  static const List<_NavBarItem> _navItems = [
    _NavBarItem(icon: Icons.home_rounded, label: 'Home'),
    _NavBarItem(icon: Icons.add_circle_rounded, label: 'Add Activity'),
    _NavBarItem(icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomAppBar(
      color: theme.scaffoldBackgroundColor,
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navItems.length, (index) {
          final isSelected = index == currentIndex;
          final item = _navItems[index];

          return InkResponse(
            onTap: () => onTap?.call(index),
            radius: 16,
            containedInkWell: false,
            splashColor: theme.primaryColor.withValues(alpha: 220),
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  color: isSelected ? theme.primaryColor : AppColors.kGreyColor,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                    color:
                        isSelected ? theme.primaryColor : AppColors.kGreyColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavBarItem {
  final IconData icon;
  final String label;

  const _NavBarItem({required this.icon, required this.label});
}