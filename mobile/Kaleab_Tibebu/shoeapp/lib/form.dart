import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoeapp/data/data.dart';

class FormPage extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final String category;
  final String description;
  final bool isUpdate;

  final TextEditingController productNameController;
  final TextEditingController productCategoryController;
  final TextEditingController productPriceController;
  final TextEditingController productDescriptionController;

  FormPage({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.isUpdate,
  })  : productNameController = TextEditingController(text: title),
        productCategoryController = TextEditingController(text: category),
        productPriceController =
            TextEditingController(text: price != 0 ? price.toString() : ''),
        productDescriptionController = TextEditingController(text: description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset('asset/images/backicon.png')),
        ),
        title: Text(isUpdate ? 'Update Product' : 'Add Product',
            style: const TextStyle(
                color: Color(0xFF3E3E3E),
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildImageUploadField(),
                const SizedBox(height: 10.0),
                const Text('name',
                    style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10.0),
                _buildTextField(
                  controller: productNameController,
                ),
                const SizedBox(height: 10.0),
                const Text('category',
                    style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10.0),
                _buildTextField(
                  controller: productCategoryController,
                ),
                const SizedBox(height: 10.0),
                const Text('price',
                    style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10.0),
                _buildTextField(
                  controller: productPriceController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'description',
                  style: TextStyle(
                      color: Color(0xFF3E3E3E),
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10.0),
                _buildTextField(
                    controller: productDescriptionController,
                    maxLines: 100,
                    height: 150),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    _addProduct(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(
                            0xFF3F51F3)), // Set background color to blue
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white), // Se
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(152, 50),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(isUpdate ? 'UPDATE' : 'ADD'),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    _deleteProduct(context);
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.red),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(152, 50),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text(
                    'DELETE',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploadField() {
    return SizedBox(
      height: 190,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.cloud_upload, size: 50.0),
            SizedBox(height: 10.0),
            Text('Upload Image',
                style: TextStyle(
                    color: Color(0xFF3E3E3E),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    double height = 60,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
        ),
      ),
    );
  }

  void _addProduct(BuildContext context) {
    String productName = productNameController.text;
    String productCategory = productCategoryController.text;
    double productPrice = double.tryParse(productPriceController.text) ?? 0.0;
    String productDescription = productDescriptionController.text;

    products.add({
      'image': 'asset/images/jordan.jpg',
      'title': productName,
      'price': productPrice,
      'category': productCategory,
      'description': productDescription
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color(0xFF3F51F3),
      content: Text(isUpdate
          ? 'Product is successfully updated'
          : 'Product is successfully added'),
      duration: const Duration(seconds: 3),
    ));
  }

  void _deleteProduct(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color(0xFF3F51F3),
      content: Text('Product is successfully deleted'),
      duration: Duration(seconds: 3),
    ));
  }
}
