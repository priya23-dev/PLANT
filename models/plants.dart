class Plants {
  final int id;
  final String name;
  final String imagePath;
  final String category;
  final String description;
  final double price;
  bool isFavorite; // To toggle favorite status

  Plants({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.price,
    this.isFavorite = false, // Default value to false
  });

  // Factory constructor to create a Plants object from a JSON map
  factory Plants.fromJson(Map<String, dynamic> json) {
    return Plants(
      id: json['id'] as int,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(), // Convert num to double
      isFavorite: json['isFavorite'] as bool? ?? false, // Default to false if null
    );
  }

  // Method to convert a Plants object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'category': category,
      'description': description,
      'price': price,
      'isFavorite': isFavorite,
    };
  }
}
