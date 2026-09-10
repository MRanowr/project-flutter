import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    // 1. ملابس داخلية
    Product(
      id: 'm_in_1',
      name: 'فنيلة داخلية بيضاء قطن',
      price: 25.0,
      imageUrl: 'assets/images/OIP.webp',
      mainCategory: 'رجال',
      category: 'ملابس داخلية',
      description: 'فنيلة داخلية بيضاء مصنوعة من القطن الطبيعي 100% لتوفير أقصى درجات الراحة.',
    ),
    Product(
      id: 'm_in_2',
      name: 'هاف داخلي قطني (نكس)',
      price: 20.0,
      imageUrl: 'assets/images/nex.webp', // المسار الجديد للصورة الثانية
      mainCategory: 'رجال',
      category: 'ملابس داخلية',
      description: 'ملابس داخلية مريحة وناعمة على البشرة.',
),

    // 2. فنايل
    Product(
      id: 'm_fan_1',
      name: 'تيشيرت مكمم كاجوال',
      price: 65.0,
      imageUrl: 'assets/images/OIP3.jpg',
      mainCategory: 'رجال',
      category: 'فنايل',
      description: 'فنيلة نصف كم أنيقة ومناسبة للخروجات اليومية.',
    ),
    Product(
      id: 'm_fan_2',
      name: 'فنيلة مقطعة (بدون أكمام)',
      price: 45.0,
      imageUrl: 'assets/images/OIP2.jpg',
      mainCategory: 'رجال',
      category: 'فنايل',
      description: 'فنيلة بدون أكمام خفيفة ومثالية للرياضة والصيف.',
    ),

    // 3. الشميز
    Product(
      id: 'm_sh_1',
      name: 'شميز مكمم رسمي ',
      price: 120.0,
      imageUrl:'assets/images/OIP4.webp',
      mainCategory: 'رجال',
      category: 'الشميز',
      description: 'قماش شميز فاخر وأنيق للمناسبات والعمل.',
    ),
    Product(
      id: 'm_sh_2',
      name: 'شميز مقطع كاجوال',
      price: 95.0,
      imageUrl:"assets/images/OIP5.webp",
      mainCategory: 'رجال',
      category: 'الشميز',
      description: 'شميز قصير الأكمام عصري ومريح للصيف.',
    ),

    // 4. البناطيل
    Product(
      id: 'm_p_1',
      name: 'بنطال جينز كلاسيك',
      price: 140.0,
      imageUrl: 'assets/images/OIP6.webp',
      mainCategory: 'رجال',
      category: 'البناطيل',
      description: 'بنطال جينز متين بتصميم عصري يناسب كافة الأوقات.',
    ),
    Product(
      id: 'm_p_2',
      name: 'بنطال برمودا صيفي',
      price: 85.0,
      imageUrl: 'assets/images/OIP7.webp',
      mainCategory: 'رجال',
      category: 'البناطيل',
      description: 'برمودا مريحة للغاية ومناسبة للرحلات والأجواء الصيفية.',
    ),

    // 5. بدلات رسمية
    Product(
      id: 'm_s_1',
      name: 'بدلة رسمية فاخرة كحلي',
      price: 450.0,
      imageUrl: 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=500',
      mainCategory: 'رجال',
      category: 'بدلات رسمية',
      description: 'بدلة رجالية كاملة مع السترة والبنطال لمظهر جذاب ورسمي.',
    ),
    Product(
      id: 'm_s_2',
      name: 'بدلة رسمية سوداء ملكي',
      price: 520.0,
      imageUrl: 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=500',
      mainCategory: 'رجال',
      category: 'بدلات رسمية',
      description: 'بدلة سوداء أنيقة بتصميم عالي الدقة والأناقة.',
    ),

    // أجزاء أخرى للتجربة
    Product(
      id: 'm_wat_1',
      name: 'ساعة يد كلاسيكية',
      price: 350.0,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
      mainCategory: 'رجال',
      category: 'ساعات',
      description: 'ساعة يد أنيقة ومقاومة للماء.',

      ),
      Product(
        id: 'm_w_2',
        name: 'ساعة سبورت رياضية',
        price: 180.0,
        imageUrl: 'assets/images/OIp9.webp',
        mainCategory: 'رجال',
        category: 'ساعات',
        description: 'ساعة رياضية مقاومة للماء مع شاشة رقمية.',
      ),
      Product(
        id: 'm_w_3',
        name: 'ساعة جلد فاخرة',
        price: 320.0,
        imageUrl: 'assets/images/OIP8.webp',
        mainCategory: 'رجال',
        category: 'ساعات',
        description: 'ساعة رجالية بسير من الجلد الطبيعي وحركة أوتوماتيكية.',
      ),

    // قسم العطور
Product(
  id: 'm_p_1',
  name: 'عطر عود ملكي فاخر',
  price: 280.0,
  imageUrl: 'assets/images/OIP11.webp',
  mainCategory: 'رجال',
  category: 'عطور',
  description: 'عطر شرقي برائحة العود الفاخر والمسك يدوم طويلاً.',
),
Product(
  id: 'm_p_2',
  name: 'عطر سبورت فرنسي',
  price: 210.0,
  imageUrl: 'assets/images/OIP12.webp',
  mainCategory: 'رجال',
  category: 'عطور',
  description: 'عطر منعش برائحة الحمضيات والأخشاب مناسب للاستخدام اليومي.',
),
Product(
  id: 'm_p_3',
  name: 'عطر ليلي فخم',
  price: 350.0,
  imageUrl: 'assets/images/OIP13.webp',
  mainCategory: 'رجال',
  category: 'عطور',
  description: 'مزيج ساحر من العنبر والتوابل الدافئة للمناسبات الخاصة.',
),

// قسم الإكسسوارات
Product(
  id: 'm_acc_1',
  name: 'محفظة جلد طبيعي',
  price: 75.0,
  imageUrl: 'assets/images/OIP14.webp',
  mainCategory: 'رجال',
  category: 'إكسسوارات',
  description: 'محفظة رجالية أنيقة من الجلد الطبيعي مع جيوب متعددة للبطاقات.',
),
Product(
  id: 'm_acc_2',
  name: 'حزام جلد كلاسيك',
  price: 60.0,
  imageUrl: 'assets/images/OIP15.webp',
  mainCategory: 'رجال',
  category: 'إكسسوارات',
  description: 'حزام رجالي متين باللون الأسود مناسب للبدل والبنطلونات الرسمية.',
),
Product(
  id: 'm_acc_3',
  name: 'كاب رجالي عصري',
  price: 45.0,
  imageUrl: 'assets/images/OIP16.webp',
  mainCategory: 'رجال',
  category: 'إكسسوارات',
  description: 'قبعة مريحة وقابلة للتعديل للحماية من الشمس أثناء الخروجات.',
),
  ];

  String _selectedMainCategory = 'رجال';
  String _selectedSubCategory = 'الكل';

  List<Product> get products {
    return _products.where((p) {
      final matchesMain = p.mainCategory == _selectedMainCategory;
      final matchesSub = _selectedSubCategory == 'الكل' || p.category == _selectedSubCategory;
      return matchesMain && matchesSub;
    }).toList();
  }

  String get selectedMainCategory => _selectedMainCategory;
  String get selectedSubCategory => _selectedSubCategory;

  void selectMainCategory(String mainCat) {
    _selectedMainCategory = mainCat;
    _selectedSubCategory = 'الكل';
    notifyListeners();
  }

  void selectSubCategory(String subCat) {
    _selectedSubCategory = subCat;
    notifyListeners();
  }
}