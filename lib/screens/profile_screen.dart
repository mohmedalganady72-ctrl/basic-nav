// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import '../data/fake_data.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // ===== صورة الملف الشخصي =====
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF3ECFCF)],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                  // زر تعديل الصورة
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6C63FF),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF0A0E1A),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.edit_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // اسم المستخدم
              Text(
                fakeUser['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                fakeUser['email']!,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 24),

              // ===== إحصائيات المستخدم =====
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2035),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(label: 'طلباتي', value: '24'),
                    _Divider(),
                    _StatItem(label: 'مفضلتي', value: '12'),
                    _Divider(),
                    _StatItem(label: 'تقييماتي', value: '8'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== معلومات الحساب =====
              _SectionTitle(title: 'معلومات الحساب'),
              const SizedBox(height: 12),
              _InfoCard(
                icon: Icons.person_outline_rounded,
                label: 'الاسم الكامل',
                value: fakeUser['name']!,
              ),
              const SizedBox(height: 10),
              _InfoCard(
                icon: Icons.phone_outlined,
                label: 'رقم الهاتف',
                value: fakeUser['phone']!,
              ),
              const SizedBox(height: 10),
              _InfoCard(
                icon: Icons.location_on_outlined,
                label: 'العنوان',
                value: fakeUser['address']!,
              ),
              const SizedBox(height: 10),
              _InfoCard(
                icon: Icons.calendar_today_outlined,
                label: 'تاريخ الانضمام',
                value: fakeUser['joinDate']!,
              ),

              const SizedBox(height: 24),

              // ===== خيارات الإعدادات =====
              _SectionTitle(title: 'الإعدادات'),
              const SizedBox(height: 12),
              _SettingsItem(
                icon: Icons.notifications_outlined,
                title: 'الإشعارات',
                onTap: () {},
              ),
              _SettingsItem(
                icon: Icons.language_outlined,
                title: 'اللغة',
                trailing: 'العربية',
                onTap: () {},
              ),
              _SettingsItem(
                icon: Icons.security_outlined,
                title: 'الخصوصية والأمان',
                onTap: () {},
              ),
              _SettingsItem(
                icon: Icons.help_outline_rounded,
                title: 'مركز المساعدة',
                onTap: () {},
              ),

              const SizedBox(height: 24),

              // ===== زر تسجيل الخروج =====
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // العودة لصفحة تسجيل الدخول
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false, // حذف كل الـ routes السابقة
                    );
                  },
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(color: Colors.red.withOpacity(0.3)),
                    ),
                    elevation: 0,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== Widgets مساعدة =====

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40,
      color: Colors.white.withOpacity(0.1),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2035),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF).withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF6C63FF), size: 20),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.icon,
    required this.title,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A2035),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF6C63FF), size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            if (trailing != null)
              Text(
                trailing!,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 13,
                ),
              ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white.withOpacity(0.3),
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
