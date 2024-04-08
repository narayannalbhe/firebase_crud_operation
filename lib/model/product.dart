class Product {
  String prodDescription;
  String prodPriceDiscount;
  String productFinalPrice;
  String productName;

  Product({
    required this.prodDescription,
    required this.prodPriceDiscount,
    required this.productFinalPrice,
    required this.productName,
  });

  // Convert the Product object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'prod_description': prodDescription,
      'prod_price_discount': prodPriceDiscount,
      'product_final_price': productFinalPrice,
      'product_name': productName,
    };
  }

  // Constructor to create Product object from a Map
  Product.fromMap(Map<String, dynamic> map)
      : prodDescription = map['prod_description'],
        prodPriceDiscount = map['prod_price_discount'],
        productFinalPrice = map['product_final_price'],
        productName = map['product_name'];
}
