// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../data/fake_data.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _selectedCategory = 'الكل';


  List<Product> get _filteredProducts {
    if (_selectedCategory == 'الكل') {
      return fakeProducts;
    }
    return fakeProducts.where((p) => p.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ===== الهيدر =====
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مرحباً، ${fakeUser['name']?.split(' ')[0]}! 👋',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'اكتشف المنتجات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // زر الإشعارات
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2035),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          // نقطة الإشعار
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF6C63FF),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ===== حقل البحث =====
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A2035),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Icon(
                        Icons.search_rounded,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'ابحث عن منتج...',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ===== البانر الترويجي =====
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6C63FF), Color(0xFF3ECFCF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'عرض خاص',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'خصم 30%\nعلى جميع الإلكترونيات',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.devices_rounded,
                          color: Colors.white,
                          size: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ===== الفئات =====
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
                    child: Text(
                      'الفئات',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final isSelected = _selectedCategory == category;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF6C63FF)
                                  : const Color(0xFF1A2035),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.6),
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ===== عنوان المنتجات =====
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المنتجات',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'عرض الكل',
                      style: TextStyle(
                        color: Color(0xFF6C63FF),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ===== شبكة المنتجات =====
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = _filteredProducts[index];
                    return _ProductCard(product: product);
                  },
                  childCount: _filteredProducts.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}

// ===== ويدجت بطاقة المنتج (Widget منفصل) =====
class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // الانتقال لصفحة تفاصيل المنتج
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A2035),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // في حالة فشل تحميل الصورة
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: const Color(0xFF252D45),
                    child: const Icon(
                      Icons.image_outlined,
                      color: Colors.white30,
                      size: 40,
                    ),
                  ),
                  // أثناء التحميل
                  // loadingBuilder: (context, child, loadingProgress) {
                  //   if (loadingProgress == null) return child;
                  //   return Container(
                  //     color: const Color(0xFF252D45),
                  //     child: const Center(
                  //       child: CircularProgressIndicator(
                  //         color: Color(0xFF6C63FF),
                  //         strokeWidth: 2,
                  //       ),
                  //     ),
                  //   );
                  // },
                ),
              ),
            ),

            // معلومات المنتج
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFB800),
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.toString(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price.toStringAsFixed(0)} ر.س',
                        style: const TextStyle(
                          color: Color(0xFF6C63FF),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
