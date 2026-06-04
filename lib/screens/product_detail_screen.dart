// lib/screens/product_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  // نستقبل المنتج كـ parameter من صفحة الهوم
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1; // الكمية المختارة
  bool _isFavorite = false; // حالة المفضلة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: Column(
        children: [
          // ===== الجزء العلوي (الصورة) =====
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                // صورة المنتج
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF1A2035),
                      child: const Icon(
                        Icons.image_outlined,
                        color: Colors.white30,
                        size: 60,
                      ),
                    ),
                  ),
                ),

                // تدرج من الأسفل
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color(0xFF0A0E1A),
                          const Color(0xFF0A0E1A).withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),

                // ===== زر الرجوع =====
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),

                // ===== زر المفضلة =====
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: _isFavorite
                            ? Colors.red.withOpacity(0.8)
                            : Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        _isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),

                // ===== شارة الفئة =====
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.product.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ===== الجزء السفلي (التفاصيل) =====
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF0A0E1A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم المنتج والسعر
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.product.price.toStringAsFixed(0)} ر.س',
                          style: const TextStyle(
                            color: Color(0xFF6C63FF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // التقييم وعدد المراجعات
                    Row(
                      children: [
                        // نجوم التقييم
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < widget.product.rating.floor()
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                              color: const Color(0xFFFFB800),
                              size: 18,
                            );
                          }),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${widget.product.rating}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${widget.product.reviewCount} تقييم)',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // خط فاصل
                    Divider(color: Colors.white.withOpacity(0.1)),

                    const SizedBox(height: 16),

                    // الوصف
                    const Text(
                      'الوصف',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ===== اختيار الكمية =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'الكمية',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            // زر الإنقاص
                            GestureDetector(
                              onTap: () {
                                if (_quantity > 1) {
                                  setState(() => _quantity--);
                                }
                              },
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A2035),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '$_quantity',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 16),
                            // زر الإضافة
                            GestureDetector(
                              onTap: () {
                                setState(() => _quantity++);
                              },
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6C63FF),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ===== زر إضافة للسلة =====
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // إظهار رسالة تأكيد
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '✅ تمت إضافة ${widget.product.name} للسلة!',
                              ),
                              backgroundColor: const Color(0xFF6C63FF),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          'إضافة للسلة - ${(widget.product.price * _quantity).toStringAsFixed(0)} ر.س',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C63FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
