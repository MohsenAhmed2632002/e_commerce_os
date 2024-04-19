class OrderItem {
  final String name;
  int quantity;
  String price;
  final String currency;

  OrderItem({
    required this.name,
 required   this.quantity,
 required   this.price,
    required this.currency,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        name: json['name'] as String,
        quantity: json['quantity'] as int,
        price: json['price'] as String,
        currency: json['currency'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
}
