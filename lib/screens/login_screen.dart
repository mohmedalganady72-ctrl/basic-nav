// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers للتحكم في حقول النص
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // متغير لإظهار/إخفاء كلمة المرور
  bool _obscurePassword = true;

  @override
  void dispose() {
    // مهم: نتخلص من الـ controllers لتجنب تسريب الذاكرة
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // دالة الانتقال لصفحة الهوم (بدون تحقق)
  void _login() {
    // ننتقل مباشرة بدون أي تحقق
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // ===== شعار التطبيق =====
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6C63FF), Color(0xFF3ECFCF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ===== عنوان الترحيب =====
              const Text(
                'مرحباً بك! 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'سجّل دخولك للمتابعة',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              // ===== حقل البريد الإلكتروني =====
              const Text(
                'البريد الإلكتروني',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'أدخل بريدك الإلكتروني',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF1A2035),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ===== حقل كلمة المرور =====
              const Text(
                'كلمة المرور',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'أدخل كلمة المرور',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  // زر إظهار/إخفاء كلمة المرور
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF1A2035),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ===== نسيت كلمة المرور =====
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // لا يوجد تنفيذ - فقط للعرض
                  },
                  child: const Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      color: Color(0xFF6C63FF),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ===== زر تسجيل الدخول =====
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ===== فاصل أو =====
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.white.withOpacity(0.2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'أو',
                      style: TextStyle(color: Colors.white.withOpacity(0.4)),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.white.withOpacity(0.2)),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ===== زر إنشاء حساب جديد =====
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: _login, // نفس الدالة - بدون تحقق
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white.withOpacity(0.3)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
