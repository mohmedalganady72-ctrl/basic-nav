// lib/screens/main_screen.dart

import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

// هذه الصفحة تحتوي على الـ Bottom Navigation Bar
// وتتحكم في أي صفحة تظهر
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // الصفحة الحالية المختارة (0 = هوم، 1 = السلة، 2 = البروفايل)
  int _currentIndex = 0;

  // قائمة الصفحات - نستخدم IndexedStack للحفاظ على حالة كل صفحة
  // بدلاً من إعادة بناء الصفحة في كل مرة
  final List<Widget> _screens = [
    const HomeScreen(),
    const _CartPlaceholder(), // صفحة وهمية للسلة
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),

      // ===== محتوى الصفحات =====
      // IndexedStack يحافظ على حالة كل صفحة ولا يعيد بناءها
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      // ===== Bottom Navigation Bar =====
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A2035),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_rounded,
                  label: 'الرئيسية',
                  isActive: _currentIndex == 0,
                  onTap: () => setState(() => _currentIndex = 0),
                ),
                _NavItem(
                  icon: Icons.shopping_cart_outlined,
                  activeIcon: Icons.shopping_cart_rounded,
                  label: 'السلة',
                  isActive: _currentIndex == 1,
                  onTap: () => setState(() => _currentIndex = 1),

                ),
                _NavItem(
                  icon: Icons.person_outline_rounded,
                  activeIcon: Icons.person_rounded,
                  label: 'حسابي',
                  isActive: _currentIndex == 2,
                  onTap: () => setState(() => _currentIndex = 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ===== ويدجت عنصر الـ Navigation =====
class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final int? badgeCount;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF6C63FF).withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isActive ? activeIcon : icon,
                  color: isActive
                      ? const Color(0xFF6C63FF)
                      : Colors.white.withOpacity(0.5),
                  size: 26,
                ),
                // Badge للعدد (مثلاً عدد منتجات السلة)
                if (badgeCount != null && badgeCount! > 0)
                  Positioned(
                    top: -6,
                    left: -6,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF4757),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$badgeCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive
                    ? const Color(0xFF6C63FF)
                    : Colors.white.withOpacity(0.5),
                fontSize: 11,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== صفحة السلة الوهمية =====
class _CartPlaceholder extends StatelessWidget {
  const _CartPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF1A2035),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFF6C63FF),
                size: 50,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'السلة فارغة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'أضف منتجات من الصفحة الرئيسية',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
