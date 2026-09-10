import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/providers/cart_provider.dart';
import '../controllers/providers/language_provider.dart';
import '../controllers/providers/product_provider.dart';
import 'cart_screen.dart';
import 'product_details_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    bool isAr = languageProvider.locale.languageCode == 'ar';
    
    // الأقسام الرئيسية والفرعية
    final mainCategories = ['رجال', 'نساء'];
    final subCategories = [
          'الكل',
          'ملابس داخلية',
          'فنايل',
          'الشميز',
          'البناطيل',
          'بدلات رسمية',
          'ساعات',
          'عطور',
          'إكسسوارات',
        ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'متجر التسوق الشامل' : 'Shopping Store'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Badge(
                isLabelVisible: cart.itemCount > 0,
                label: Text('${cart.itemCount}'),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. تبديل القسم الرئيسي (رجال / نساء)
          Container(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: mainCategories.map((cat) {
                final isSelected = productProvider.selectedMainCategory == cat;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    label: Text(cat, style: const TextStyle(fontWeight: FontWeight.bold)),
                    selected: isSelected,
                    selectedColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                    onSelected: (_) => productProvider.selectMainCategory(cat),
                  ),
                );
              }).toList(),
            ),
          ),

          // 2. شريط الأقسام الفرعية (ملابس، ساعات، إلكترونيات...)
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subCategories.length,
              itemBuilder: (context, index) {
                final subCat = subCategories[index];
                final isSelected = productProvider.selectedSubCategory == subCat;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(subCat, style: const TextStyle(fontSize: 12)),
                    selected: isSelected,
                    onSelected: (_) => productProvider.selectSubCategory(subCat),
                  ),
                );
              },
            ),
          ),

          // 3. شبكة المنتجات (بإطار مزخرف وصغير لعرض عناصر أكثر)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: productProvider.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // زلنا العدد إلى 3 أعمدة لتصغير الإطارات وعرض أصناف أكثر
                  childAspectRatio: 0.65, // تحكم بارتفاع وعرض الإطار
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.amber.shade700, width: 1.5), // إطار مزخرف بلون ذهبي
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                      color: Theme.of(context).cardColor,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: product)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                              child: product.imageUrl.startsWith('http')
                                  ? Image.network(
                                      product.imageUrl,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                                    )
                                  : Image.asset(
                                      product.imageUrl,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${product.price} ر.س',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}