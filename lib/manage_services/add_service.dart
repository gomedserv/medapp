import 'package:flutter/material.dart';
import 'package:gomedserv/widgets/topbar.dart';
import 'package:gomedserv/widgets/custom_button.dart';
import 'package:gomedserv/home/dashboard_screen.dart'; // Assuming you have this widget

class AddServiceScreen extends StatefulWidget {
  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String? _selectedCategory;
  final List<String> _categories = [
    'Plumbing',
    'Electrical',
    'Cleaning',
    'Painting',
    'Gardening'
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(
                title: 'Add Service',
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20), // Add spacing after the TopBar
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _serviceNameController,
                      decoration: InputDecoration(
                        labelText: 'Service Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a service name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedCategory,
                      items: _categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    TextFormField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid price';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30), // Add spacing before the button

                    CustomButton(
                      text: 'Add Service',
                      color: const Color(0xFF2A9D8F),
                      screenWidth: screenWidth,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Add your onTap logic here
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            // Add navigation logic based on the index here.
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _serviceNameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
