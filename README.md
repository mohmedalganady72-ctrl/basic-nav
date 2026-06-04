# Flutter Shop - مشروع تعليمي للمبتدئين

مشروع Flutter أساسي يوضح المفاهيم الأساسية لبناء تطبيق موبايل.

---

## 📁 هيكل المشروع

```
lib/
├── main.dart                          # نقطة بداية التطبيق
├── data/
│   └── fake_data.dart                 # البيانات الوهمية
├── models/
│   └── product.dart                   # نموذج المنتج (Product Model)
└── screens/
    ├── login_screen.dart              # صفحة تسجيل الدخول
    ├── main_screen.dart               # الصفحة الرئيسية + Bottom Nav Bar
    ├── home_screen.dart               # صفحة الهوم
    ├── product_detail_screen.dart     # صفحة تفاصيل المنتج
    └── profile_screen.dart            # صفحة البروفايل
```

---

## 📱 الصفحات

### 1. صفحة تسجيل الدخول (LoginScreen)
- حقول البريد الإلكتروني وكلمة المرور
- زر إظهار/إخفاء كلمة المرور
- الانتقال المباشر بدون أي تحقق

### 2. صفحة الهوم (HomeScreen)
- بانر ترويجي
- فلترة المنتجات حسب الفئة
- شبكة بطاقات المنتجات (Grid)
- الانتقال لصفحة التفاصيل عند الضغط

### 3. صفحة تفاصيل المنتج (ProductDetailScreen)
- عرض صورة المنتج بشكل كبير
- الوصف والتقييم والسعر
- اختيار الكمية
- زر الإضافة للسلة مع SnackBar

### 4. صفحة البروفايل (ProfileScreen)
- معلومات المستخدم الوهمية
- إحصائيات (طلبات، مفضلة، تقييمات)
- إعدادات التطبيق
- زر تسجيل الخروج

---

## 🧭 التنقل (Navigation)

```
LoginScreen
    ↓ (Navigator.pushReplacement)
MainScreen  ← يحتوي على Bottom Navigation Bar
    ├── HomeScreen (index: 0)
    │       ↓ (Navigator.push)
    │   ProductDetailScreen
    ├── CartScreen (index: 1) - صفحة وهمية
    └── ProfileScreen (index: 2)
            ↓ (Navigator.pushAndRemoveUntil)
        LoginScreen
```

---

## 🔑 مفاهيم Flutter المستخدمة

| المفهوم | الملف |
|---------|-------|
| StatefulWidget & setState | login_screen, home_screen, product_detail |
| StatelessWidget | profile_screen, widgets مساعدة |
| Navigator.push / pushReplacement | بين الصفحات |
| IndexedStack | main_screen (للحفاظ على حالة الصفحات) |
| TextEditingController | login_screen |
| CustomScrollView + Slivers | home_screen |
| Image.network | product cards |
| ScaffoldMessenger (SnackBar) | product_detail_screen |
| AnimatedContainer | home_screen, main_screen |

---

## 🚀 كيفية تشغيل المشروع

```bash
# تثبيت الاعتماديات
flutter pub get

# تشغيل التطبيق
flutter run
```

---

## 💡 ملاحظات للمبتدئين

1. **لا يوجد State Management** - كل شيء يعتمد على `setState()` الأساسية
2. **البيانات وهمية** - كلها في `fake_data.dart` وتُمرر بين الصفحات
3. **تمرير البيانات** - نستخدم constructor parameters (مثل `ProductDetailScreen(product: product)`)
4. **dispose()** - مهم جداً لتنظيف الـ controllers ومنع تسريب الذاكرة
