class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String mainCategory; // 'رجال' أو 'نساء'
  final String category;     // 'ملابس', 'ساعات', 'عطور', إلخ
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.mainCategory,
    required this.category,
    required this.description,
  });
}