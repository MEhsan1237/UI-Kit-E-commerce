class CartItem {
  final String image;
  final String label;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.label,
    required this.price,
    this.quantity = 1,
  });
}

// Global cart list
List<CartItem> globalCart = [];
