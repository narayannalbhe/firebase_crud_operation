import 'package:flutter/material.dart';

class EditProductDetails extends StatefulWidget {
  const EditProductDetails({super.key});

  @override
  State<EditProductDetails> createState() => _EditProductDetailsState();
}

class _EditProductDetailsState extends State<EditProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Product Details'
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
