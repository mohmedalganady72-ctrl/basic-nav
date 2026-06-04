// lib/data/fake_data.dart

import '../models/product.dart';

// ===== بيانات وهمية للمستخدم =====
final Map<String, String> fakeUser = {
  'name': 'محمد الجندي',
  'email': 'moalganady@gmail.com',
  'phone': '+967 731 234 567',
  'address': ' اليمن',
  'joinDate': '2026',
};

// ===== بيانات وهمية للمنتجات =====
final List<Product> fakeProducts = [
  Product(
    id: 1,
    name: 'سماعات لاسلكية Pro',
    description:
        'سماعات لاسلكية عالية الجودة مع خاصية إلغاء الضوضاء النشط. توفر صوتاً نقياً وواضحاً مع بطارية تدوم حتى 30 ساعة. مريحة للاستخدام اليومي وتتميز بتصميم أنيق وعصري.',
    price: 299.99,
    imageUrl: 'images/blutoth.jpg',
    category: 'إلكترونيات',
    rating: 4.8,
    reviewCount: 234,
  ),
  Product(
    id: 2,
    name: 'ساعة ذكية Sport',
    description:
        'ساعة ذكية رياضية متكاملة تتابع نشاطك اليومي وصحتك. تدعم قياس نبضات القلب وضغط الأكسجين في الدم. مقاومة للماء ومثالية للرياضيين.',
    price: 449.00,
    imageUrl: 'images/smartea.jpg',
    category: 'إلكترونيات',
    rating: 4.6,
    reviewCount: 189,
  ),
  Product(
    id: 3,
    name: 'حقيبة ظهر Premium',
    description:
        'حقيبة ظهر فاخرة مصنوعة من الجلد الإيطالي الأصلي. تحتوي على جيوب متعددة وحجم مثالي للاستخدام اليومي والسفر. تصميم أنيق يناسب الرجل العصري.',
    price: 599.00,
    imageUrl: 'images/bage.jpg',
    category: 'أزياء',
    rating: 4.9,
    reviewCount: 87,
  ),
  Product(
    id: 4,
    name: 'لابتوب Ultra Slim',
    description:
        'لابتوب رفيع وخفيف الوزن بمعالج قوي وشاشة OLED مذهلة. مثالي للعمل والدراسة. بطارية تدوم 12 ساعة مع شحن سريع.',
    price: 3499.00,
    imageUrl: 'images/latop.jpg',
    category: 'إلكترونيات',
    rating: 4.7,
    reviewCount: 312,
  ),
  Product(
    id: 5,
    name: 'عطر Gold Edition',
    description:
        'عطر فاخر بمزيج من العود والمسك والورد. رائحة مميزة تدوم طويلاً ومناسبة لجميع المناسبات. من أشهر دور العطور العالمية.',
    price: 189.00,
    imageUrl: 'images/gold.jpg',
    category: 'عناية شخصية',
    rating: 4.5,
    reviewCount: 156,
  ),
  Product(
    id: 6,
    name: 'كاميرا Mirrorless Pro',
    description:
        'كاميرا احترافية بدون مرآة بدقة 24 ميجابكسل. مناسبة للمصورين المحترفين والهواة. تسجيل فيديو 4K مع تثبيت فائق للصورة.',
    price: 2799.00,
    imageUrl: 'images/camra.jpg',
    category: 'إلكترونيات',
    rating: 4.9,
    reviewCount: 421,
  ),
];

// ===== فئات المنتجات =====
final List<String> categories = [
  'الكل',
  'إلكترونيات',
  'أزياء',
  'عناية شخصية',
  'رياضة',
];
