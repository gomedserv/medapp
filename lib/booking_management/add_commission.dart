import 'package:flutter/material.dart';
import 'package:gomedserv/widgets/topbar.dart';
import 'package:gomedserv/widgets/custom_button.dart';
import 'package:gomedserv/home/dashboard_screen.dart'; // Assuming you have this widget

class AddCommission extends StatefulWidget {
  @override
  _AddCommissionState createState() => _AddCommissionState();
}

class _AddCommissionState extends State<AddCommission> {
  String? selectedServiceVendor;
  final TextEditingController commissionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                title: 'Add Commission',
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Side Heading
                    Text(
                      "Set Commission Rates",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Descriptive Text
                    Text(
                      "Manage commission rates for services and vendors",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Side Heading for Service/Vendor
                    Text(
                      "Service/Vendor",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Dropdown for Service/Vendor
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Service',
                        hintText: 'Enter Service',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A9D8F), width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF2A9D8F), width: 1.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      value: selectedServiceVendor,
                      items: [
                        DropdownMenuItem(
                          value: 'Service A',
                          child: Text('Service A'),
                        ),
                        DropdownMenuItem(
                          value: 'Vendor B',
                          child: Text('Vendor B'),
                        ),
                        // Add more services/vendors here
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedServiceVendor = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    // Side Heading for Commission Rate
                    Text(
                      "Commission Rate",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Commission Rate TextField with percentage symbol outside
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: commissionController,
                            decoration: InputDecoration(
                              labelText: 'Commission',
                              hintText: 'Enter commission percentage',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF2A9D8F), width: 2.0),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF2A9D8F), width: 1.0),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "%",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Save Commission Button
                    CustomButton(
                      text: 'Save Commission',
                      color: const Color(0xFF2A9D8F),
                      screenWidth: screenWidth,
                      onTap: () {
                        // Handle save action here
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
            // Handle bottom navigation tap
          },
        ),
      ),
    );
  }
}
