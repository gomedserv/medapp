import 'package:flutter/material.dart';
import 'package:gomedserv/widgets/topbar.dart';
import 'package:gomedserv/user_management/manageusers_screen.dart';
import 'package:gomedserv/widgets/bottomnavigation.dart';
import 'package:gomedserv/widgets/custom_button.dart';

class UserProfileScreen extends StatelessWidget {
  final User user;

  UserProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                title: 'User Profile',
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Profile Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Username: ${user.username}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Email: ${user.email}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Date: ${user.date}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Status: ${user.status}",
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            user.status == 'Active' ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Activity Log",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Recent Bookings",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Table(
                      border: TableBorder.all(color: Colors.white),
                      columnWidths: {
                        0: const FixedColumnWidth(40.0), // S.no column width
                        1: const FlexColumnWidth(), // Service column width
                        2: const FixedColumnWidth(100.0), // Date column width
                        3: const FlexColumnWidth(), // Assigned column width
                        4: const FixedColumnWidth(70.0), // Status column width
                      },
                      children: [
                        const TableRow(
                          decoration: BoxDecoration(color: Color(0xFF2A9D8F)),
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('S.no',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Service',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Date',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Assign',
                                  maxLines: 1,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Status',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        ...userProfile.activityLog
                            .asMap()
                            .entries
                            .map((entry) => TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${entry.key + 1}'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(entry.value.service),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(entry.value.date),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(entry.value.assignedTo),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        entry.value.status,
                                        style: TextStyle(
                                          color:
                                              entry.value.status == 'Completed'
                                                  ? Colors.green
                                                  : Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Reviews Given",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ...userProfile.reviews.map((review) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Reviewed ${review.service} with ${review.rating} Stars On ${review.date}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomButton(
                text: 'Deactivate Account',
                color: Colors.red,
                screenWidth: MediaQuery.of(context).size.width,
                onTap: () {
                  // Add your onTap logic here
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class UserProfile {
  final String username;
  final String email;
  final String date;
  final String status;
  final List<ActivityLog> activityLog;
  final List<Review> reviews;

  UserProfile({
    required this.username,
    required this.email,
    required this.date,
    required this.status,
    required this.activityLog,
    required this.reviews,
  });
}

class ActivityLog {
  final String service;
  final String date;
  final String assignedTo;
  final String status;

  ActivityLog({
    required this.service,
    required this.date,
    required this.assignedTo,
    required this.status,
  });
}

class Review {
  final String service;
  final int rating;
  final String date;

  Review({
    required this.service,
    required this.rating,
    required this.date,
  });
}

UserProfile userProfile = UserProfile(
  username: 'Orthopedic Surgery',
  email: 'johndoe@example.com',
  date: '01/01/2023',
  status: 'Active',
  activityLog: [
    ActivityLog(
      service: 'Pediatric Care:',
      date: '01/09/2024',
      assignedTo: 'John Doe',
      status: 'Completed',
    ),
    ActivityLog(
      service: 'Dermatology',
      date: '02/09/2024',
      assignedTo: 'Jane Smith',
      status: 'Pending',
    ),
  ],
  reviews: [
    Review(
      service: 'Orthopedic Surgery',
      rating: 5,
      date: '01/09/2024',
    ),
  ],
);
