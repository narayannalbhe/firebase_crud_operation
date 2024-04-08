

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_operation/model/product.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _descriptionController;
  late TextEditingController _priceDiscountController;
  late TextEditingController _finalPriceController;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _priceDiscountController = TextEditingController();
    _finalPriceController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _priceDiscountController.dispose();
    _finalPriceController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Product Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceDiscountController,
            decoration: InputDecoration(labelText: 'Price Discount'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a price discount';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _finalPriceController,
            decoration: InputDecoration(labelText: 'Final Price'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a final price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Product Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a product name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Form is valid, submit data
                _submitForm();
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _submitForm() async {
    // Create a new Product object from user input
    Product product = Product(
      prodDescription: _descriptionController.text,
      prodPriceDiscount: _priceDiscountController.text,
      productFinalPrice: _finalPriceController.text,
      productName: _nameController.text,
    );

    // Convert the Product object to a Map
    Map<String, dynamic> productData = product.toMap();

    // Add the product data to Firestore with a custom document ID
    String productId = 'your_custom_product_id'; // Replace 'your_custom_product_id' with your actual custom ID
    await FirebaseFirestore.instance.collection('products').doc(productId).set(productData);

    // Show a success message or navigate to another screen
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product added to Firestore')));
  }
}
