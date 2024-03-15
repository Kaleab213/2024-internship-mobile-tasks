import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCategoryController =
      TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();

  FormPage({super.key});

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
        title: const Text('Add Product',
            style: TextStyle(
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
                const Text('price',
                    style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10.0),
                _buildTextField(
                  controller: productNameController,
                  maxLines: 2,
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
                  maxLines: 2,
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
                  maxLines: 2,
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
                  maxLines: 5,
                ),
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
                  child: const Text('ADD'),
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
  }) {
    return Container(
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
          contentPadding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }

  void _addProduct(BuildContext context) {
    String productName = productNameController.text;
    String productCategory = productCategoryController.text;
    double productPrice = double.tryParse(productPriceController.text) ?? 0.0;
    String productDescription = productDescriptionController.text;

    if (kDebugMode) {
      print(
          'Product Added: $productName, $productCategory, $productPrice, $productDescription');
    }
  }

  void _deleteProduct(BuildContext context) {
    if (kDebugMode) {
      print('Product Deleted');
    }
  }
}
